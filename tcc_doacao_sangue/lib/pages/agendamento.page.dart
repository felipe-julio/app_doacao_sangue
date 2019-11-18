import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcc_doacao_sangue/models/hemocentro.model.dart';
import 'package:tcc_doacao_sangue/repositories/hemocentro.repository.dart';

class AgendamentoPage extends StatefulWidget {
  @override
  _AgendamentoPageState createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  final hemocentroRepository = new HemocentroRepository();

  var _formKey = GlobalKey<FormState>();
  List<Hemocentro> listaHemocentros = [];
  String _hemocentroSelecionado = "";
  DateTime _horario;
  DateFormat _format = DateFormat("dd-mm-yyyy HH:mm");
  List<DropdownMenuItem<String>> dropdownList = [
    new DropdownMenuItem(
      value: "",
      child: Text("Escolha um hemocentro"),
    ),
  ];

  @override
  initState() {
    carregarHemocentros();
    _hemocentroSelecionado = dropdownList[0].value;
  }

  void changedDropDownItem(String hemocentroSelecionado) {
    setState(() {
      _hemocentroSelecionado = hemocentroSelecionado;
    });
  }

  void carregarHemocentros() async {
    var response = await hemocentroRepository.get();

    for (Hemocentro item in response) {
      var hemocentro = new DropdownMenuItem(
        value: item.id,
        child: Text(item.nome),
      );
      dropdownList.add(hemocentro);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Agendamento"),
          ),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Escolha o Hemocentro:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      DropdownButton(
                        value: _hemocentroSelecionado,
                        items: dropdownList,
                        onChanged: changedDropDownItem,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Digite o nome da pessoa que vai ao agendamento:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: "Nome",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Horário",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DateTimeField(
                            format: _format,
                            onShowPicker: (context, currentValue) async {
                              final date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                              if (date != null) {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                this._horario =
                                    DateTimeField.combine(date, time);
                                return DateTimeField.combine(date, time);
                              } else {
                                return currentValue;
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 60,
                          right: 60,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            boxShadow: [
                              new BoxShadow(
                                offset: new Offset(-1.0, 2.0),
                                blurRadius: 7,
                              )
                            ]),
                        child: FlatButton(
                          child: Text(
                            "Agendar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
