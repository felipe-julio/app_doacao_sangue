import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Cadastrar Novo Usuário",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nome",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Nome",
                    ),
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
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Idade",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nome De Usuário",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Nome de Usuário",
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Senha",
                    ),
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
                      onPressed: () {},
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
}
