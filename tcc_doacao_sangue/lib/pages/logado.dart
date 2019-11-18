import 'package:flutter/material.dart';

class Logado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuario Logado "),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Row(
          children: <Widget>[
            Text(
              "Usuário logado com sucesso",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
