// import 'package:flutter/material.dart';

// class Input extends StatefulWidget {
//   var inputType = TextInputType.text;
//   var labelText = "Input";
//   var obscureText = false;
//   String value;

//   Input({
//     @required this.inputType,
//     @required this.labelText,
//     this.obscureText,
//     this.value,
//   });

//   @override
//   _InputState createState() => _InputState(this.value);
// }

// class _InputState extends State<Input> {
//   _InputState(String value);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       height: 60,
//       child: TextFormField(
//         keyboardType: widget.inputType,
//         obscureText: widget.obscureText,
//         onSaved: (value) {
//           setState(() {
//             value = value;
//           });
//         },
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           labelText: widget.labelText,
//           labelStyle: TextStyle(
//             color: Colors.black.withOpacity(0.5),
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//           ),
//         ),
//         style: TextStyle(
//           color: Colors.black.withOpacity(0.5),
//         ),
//       ),
//     );
//   }
// }
