import 'dart:convert';

import 'package:flutter/material.dart';

class Feed {
  String id;
  String descricao;
  String imagem64;
  Image imagem;

  Feed(String descricao, String imagem64) {
    this.descricao = descricao;
    this.imagem64 = imagem64;
    this.imagem = this.imagem64 != null
        ? Image.memory(Base64Decoder().convert(imagem64))
        : null;
  }

  Feed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['imagem'] = this.imagem;
    return data;
  }
}
