import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcc_doacao_sangue/models/hemocentro.model.dart';
import 'package:tcc_doacao_sangue/models/horario-agendamento.model.dart';
import 'package:tcc_doacao_sangue/repositories/hemocentro.repository.dart';

class CadastroHemocentroPage extends StatefulWidget {
  @override
  _CadastroHemocentroPageState createState() => _CadastroHemocentroPageState();
}

class _CadastroHemocentroPageState extends State<CadastroHemocentroPage> {
  var _formKey = GlobalKey<FormState>();

  final repository = HemocentroRepository();
  String nomeHemocentro;
  String email;
  String senha;
  List<HorarioAgendamento> horarios = [];
  DateTime horaInicio;
  DateTime horaFim;
  String _dia;
  final format = DateFormat("HH:mm");

  Future<Widget> submit() async {
    _formKey.currentState.save();
    var hemocentro = new Hemocentro();
    hemocentro.nome = this.nomeHemocentro;
    hemocentro.email = this.email;
    hemocentro.senha = senha;
    hemocentro.horarios = horarios;

    var responseCadastro = await this.repository.post(hemocentro);

    if (responseCadastro == 200) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Cadastrado com sucesso"),
            );
          });
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Ocorreu um erro Tente Novamente"),
            );
          });
    }
  }

  void addHorario() {
    var horarioCorrente = new HorarioAgendamento();
    horarioCorrente.horaInicio = horaInicio;
    horarioCorrente.horaFim = horaFim;
    horarioCorrente.diaSemana = _dia;
    this.horarios.add(horarioCorrente);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Nome do Hemocentro",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Nome do Hemocentro",
                    ),
                    onSaved: (String value) {
                      this.nomeHemocentro = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    onSaved: (String value) {
                      this.email = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Senha",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Senha",
                    ),
                    onSaved: (String value) {
                      this.senha = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Horários de Atendimento: ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Dias"),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                    value: _dia,
                    items: getDropDownMenuItems(),
                    onChanged: changedDropDownItem,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Inicio",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DateTimeField(
                        format: format,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(
                                currentValue ?? DateTime.now()),
                          );
                          this.horaInicio =
                              DateTimeField.combine(DateTime.now(), time);
                          return DateTimeField.combine(DateTime.now(), time);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Fim",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DateTimeField(
                        format: format,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(
                                currentValue ?? DateTime.now()),
                          );
                          this.horaFim =
                              DateTimeField.combine(DateTime.now(), time);
                          return DateTimeField.combine(DateTime.now(), time);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 120,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          new BoxShadow(
                            offset: new Offset(-1.0, 2.0),
                            blurRadius: 7,
                          )
                        ]),
                    child: FlatButton(
                      child: Text(
                        "Adicionar Horário",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: addHorario,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
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
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: this.submit,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void changedDropDownItem(String diaSelecionado) {
    setState(() {
      _dia = diaSelecionado;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();

    items.add(
        new DropdownMenuItem(value: "1", child: new Text("Segunda a Sexta")));
    items.add(
        new DropdownMenuItem(value: "2", child: new Text("Segunda a Sábado")));
    items.add(
        new DropdownMenuItem(value: "3", child: new Text("Segunda a Domingo")));

    return items;
  }
}
