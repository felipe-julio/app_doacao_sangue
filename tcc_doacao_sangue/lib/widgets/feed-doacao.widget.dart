import 'package:flutter/material.dart';

class FeedDoacao extends StatelessWidget {
  Image imagem;
  String descricao;

  FeedDoacao({this.imagem, this.descricao});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Center(
          child: imagem,
          heightFactor: 1,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          descricao,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
