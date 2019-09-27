import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.2,
                0.9
              ],
              colors: [
                Color(0xFFFF0000),
                Color(0xFFF24A63),
              ]),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(90, 160, 60, 100),
              child: Text(
                "Sangue Bom App",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
