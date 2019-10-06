import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  var type = "email";
  String value;

  InputContainer({@required this.type, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 50,
        right: 60,
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
            type == "email" ? Icons.person : Icons.lock,
          ),
          SizedBox(
            width: 10,
          ),
          type == "email"
              ? Container(
                  width: 200,
                  height: 60,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Usuário",
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
                )
              : Container(
                  width: 200,
                  height: 60,
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Senha",
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
    );
  }
}
