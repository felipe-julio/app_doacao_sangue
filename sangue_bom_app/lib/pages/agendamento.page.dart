import 'package:flutter/material.dart';

class AgendamentoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          title: Text("Agendamento"),
        ),
      ),
    );
  }
}
