import 'dart:convert';

import 'package:http/http.dart';
import 'package:tcc_doacao_sangue/models/pessoa.model.dart';

class PessoaRepository {
  var client = new Client();

  Future<List<Pessoa>> get() async {
    var response = await client
        .get('https://sangue-bom-web-app.azurewebsites.net/api/pessoa');

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List<dynamic>;
      var pessoas = new List<Pessoa>();

      for (dynamic item in list) {
        var pessoa = new Pessoa();
        pessoa.id = item["id"];
        pessoa.nome = item["nome"];
        pessoa.idade = item["idade"];
        pessoa.genero = item["genero"];
        pessoas.add(pessoa);
      }

      return pessoas;
    } else {
      throw Exception('Deu Ruim');
    }
  }

  Future<int> post(Pessoa obj) async {
    var objSerializado = json.encode({
      "nome": obj.nome,
      "idade": obj.idade,
      "genero": obj.genero,
      "senha": obj.senha,
      "email": obj.email
    });

    var response = await client.post(
        "https://sangue-bom-web-app.azurewebsites.net/api/pessoa",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: objSerializado);

    return response.statusCode;
  }

  // Future<Hemocentro> getById(String id) async {
  //   var response = await client
  //       .get("https://web-app-aps.azurewebsites.net/api/enchentes/" + id);

  //   if (response.statusCode == 200) {
  //     var item = json.decode(response.body) as dynamic;
  //     var enchente = new Hemocentro();
  //     enchente.id = item["id"];
  //     enchente.bairro = item["bairro"];
  //     enchente.rua = "ffef" + item["rua"];

  //     return enchente;
  //   } else {
  //     throw Exception('Problema ao consultar enchente por id');
  //   }
  // }
}
