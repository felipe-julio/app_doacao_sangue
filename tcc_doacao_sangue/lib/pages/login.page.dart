import 'package:flutter/material.dart';
import 'package:tcc_doacao_sangue/models/usuario.model.dart';
import 'package:tcc_doacao_sangue/repositories/usuario.repository.dart';
import 'package:validate/validate.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String user = "";
  String password = "";
  bool logado = true;

  final usuarioRepository = new UsuarioRepository();

  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'O email é inválido';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'A senha deve conter mais que 8 caracteres.';
    }

    return null;
  }

  void submit() async {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();

      var usuario = Usuario(usuarioNome: user, senha: password);
      var result = await usuarioRepository.logar(usuario);

      if (result) {
        this.logado = true;
        Navigator.pushNamed(context, "/Home");
      } else {
        this.logado = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.3,
                0.9
              ],
              colors: [
                Color(0xFFFF0000),
                Color(0xFFFF),
              ]),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(90, 110, 60, 100),
                child: Text(
                  "App Sangue Bom",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 20,
                ),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.red.withOpacity(0.2),
                    ),
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.red.withOpacity(0.2),
                    ),
                    right: BorderSide(
                      width: 1,
                      color: Colors.red.withOpacity(0.2),
                    ),
                    left: BorderSide(
                      width: 1,
                      color: Colors.red.withOpacity(0.2),
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 200,
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Usuário",
                          labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        onSaved: (String value) {
                          this.user = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30,
                  right: 20,
                ),
                height: 60,
                width: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.red.withOpacity(0.2),
                    ),
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.red.withOpacity(0.2),
                    ),
                    right: BorderSide(
                      width: 1,
                      color: Colors.red.withOpacity(0.2),
                    ),
                    left: BorderSide(
                      width: 1,
                      color: Colors.red.withOpacity(0.2),
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.lock,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 250,
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        onSaved: (String value) {
                          this.password = value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Senha",
                          labelStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                this.logado ? "" : "Nome ou Senha Incorretos",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 60,
                  right: 60,
                ),
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(60),
                    ),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(-2.0, 5.0),
                        blurRadius: 7,
                      )
                    ]),
                child: FlatButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: this.submit,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text(
                  "Cadastrar",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () => {
                  Navigator.pushNamed(context, "/HomeHemocentro"),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
