import 'dart:convert';

import 'package:http/http.dart';
import 'package:tcc_doacao_sangue/models/agendamento.model.dart';

class AgendamentoRepository {
  var client = new Client();

  Future<List<Agendamento>> get() async {
    var response = await client
        .get('https://sangue-bom-web-app.azurewebsites.net/api/agendamentos');

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List<dynamic>;
      var agendamentos = new List<Agendamento>();

      for (dynamic item in list) {
        var hemocentro = new Agendamento();
        hemocentro.id = item["id"];
        hemocentro.nome = item["nome"];
        hemocentro.hemocentroId = item["hemocentroId"];
        hemocentro.agendado = item["agendado"];

        agendamentos.add(hemocentro);
      }

      return agendamentos;
    } else {
      throw Exception('Deu Ruim');
    }
  }

  Future<List<Agendamento>> getByPessoaId(String id) async {
    var response = await client.get(
        "https://sangue-bom-web-app.azurewebsites.net/api/agendamentos/" +
            id +
            "/pessoa");

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List<dynamic>;
      var agendamentos = new List<Agendamento>();

      for (dynamic item in list) {
        var hemocentro = new Agendamento();
        hemocentro.id = item["id"];
        hemocentro.nome = item["nome"];
        hemocentro.hemocentroId = item["hemocentroId"];
        hemocentro.pessoaId = item["pessoaId"];
        hemocentro.agendado = item["agendado"];
        hemocentro.hemocentroDesc = item["hemocentroDesc"];

        agendamentos.add(hemocentro);
      }

      return agendamentos;
    } else {
      throw Exception('Deu Ruim');
    }
  }

  Future<int> post(Agendamento obj) async {
    var objSerializado = json.encode({
      "hemocentroId": obj.hemocentroId,
      "nome": obj.nome,
      "agendado": obj.agendado
    });

    var response = await client.post(
        "https://sangue-bom-web-app.azurewebsites.net/api/agendamentos",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: objSerializado);

    return response.statusCode;
  }
}
