import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc_doacao_sangue/models/feed.model.dart';
import 'package:tcc_doacao_sangue/repositories/feed.repository.dart';

class CadastroFeed extends StatefulWidget {
  @override
  _CadastroFeedState createState() => _CadastroFeedState();
}

class _CadastroFeedState extends State<CadastroFeed> {
  var _formKey = GlobalKey<FormState>();

  final repository = new FeedRepository();

  int responseStatusCode;

  String descricao = "";

  File _image;

  String imagem64;

  Future<Widget> submit() async {
    _formKey.currentState.save();

    if (this._image != null) {
      List<int> imagemByteArray = this._image.readAsBytesSync();
      imagem64 = Base64Encoder().convert(imagemByteArray);
    }

    var feed = new Feed(descricao, imagem64);
    var response = await this.repository.post(feed);

    if (response == 200) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Feed Cadastrado"),
            );
          });
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Ocorreu um erro Tente Novamente"),
            );
          });
    }
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      this._image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro Feed")),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Descrição:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Descrição",
                    ),
                    onSaved: (String value) {
                      this.descricao = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: "Foto",
                          backgroundColor: Colors.redAccent,
                          onPressed: getImage,
                          tooltip: 'Pick Image',
                          child: Icon(Icons.add_a_photo),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 60,
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
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: this.submit,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
