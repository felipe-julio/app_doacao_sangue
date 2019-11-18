import 'package:flutter/material.dart';
import 'package:tcc_doacao_sangue/models/pessoa.model.dart';
import 'package:tcc_doacao_sangue/repositories/pessoa.repository.dart';

class CadastroPessoaPage extends StatefulWidget {
  @override
  _CadastroPessoaPageState createState() => _CadastroPessoaPageState();
}

class _CadastroPessoaPageState extends State<CadastroPessoaPage> {
  var _formKey = GlobalKey<FormState>();
  final repository = PessoaRepository();

  String _genero;
  String nome = "";
  int idade;
  String senha = "";
  String email = "";

  Future<Widget> submit() async {
    _formKey.currentState.save();
    var pessoa = new Pessoa();
    pessoa.nome = this.nome;
    pessoa.idade = this.idade;
    pessoa.genero = _genero;
    pessoa.senha = this.senha;
    pessoa.email = this.email;

    var responseCadastro = await this.repository.post(pessoa);

    if (responseCadastro == 200) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Cadastrado com sucesso"),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "Começar",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () => {
                    Navigator.pushNamed(context, "/Home"),
                  },
                ),
              ],
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
                    "Nome",
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
                    onSaved: (String value) {
                      this.nome = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email",
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
                      hintText: "Email",
                    ),
                    onSaved: (String value) {
                      this.email = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Idade",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Idade",
                    ),
                    onSaved: (String value) {
                      this.idade = int.parse(value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Genero",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButton(
                    value: _genero,
                    items: getDropDownMenuItems(),
                    onChanged: changedDropDownItem,
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
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
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
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 60,
                      right: 60,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.8),
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
                          color: Colors.white70,
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

  void changedDropDownItem(String generoSelecionado) {
    setState(() {
      _genero = generoSelecionado;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();

    items.add(new DropdownMenuItem(value: "m", child: new Text("Masculino")));
    items.add(new DropdownMenuItem(value: "f", child: new Text("Feminino")));

    return items;
  }
}
