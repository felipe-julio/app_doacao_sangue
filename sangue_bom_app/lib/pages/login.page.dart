import 'package:flutter/material.dart';
import 'package:sangue_bom_app/widgets/button.widget.dart';
import 'package:sangue_bom_app/widgets/input-container.dart';

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
                0.3,
                0.9
              ],
              colors: [
                Color(0xFFFF0000),
                Color(0xFFFF),
              ]),
        ),
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
            InputContainer(
              type: "email",
            ),
            SizedBox(
              height: 15,
            ),
            InputContainer(
              type: "senha",
            ),
            SizedBox(
              height: 25,
            ),
            Button(),
          ],
        ),
      ),
    );
  }
}
