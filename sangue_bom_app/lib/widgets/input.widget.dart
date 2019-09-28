import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  var inputType = TextInputType.text;
  var labelText = "Input";
  var obscureText = false;

  Input({@required this.inputType, @required this.labelText, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      child: TextFormField(
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
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
    );
  }
}
