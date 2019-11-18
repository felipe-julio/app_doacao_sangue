import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipoCadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("O que você é"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 120,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 130,
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
                "Hemonucleo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/CadastrarHemocentro");
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 130,
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
                "Pessoa",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/CadastrarPessoa");
              },
            ),
          ),
        ],
      ),
    );
  }
}
