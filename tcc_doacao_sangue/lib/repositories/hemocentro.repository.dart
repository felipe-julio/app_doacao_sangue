import 'dart:convert';

import 'package:http/http.dart';
import 'package:tcc_doacao_sangue/models/hemocentro.model.dart';
import 'package:tcc_doacao_sangue/models/horario-agendamento.model.dart';

class HemocentroRepository {
  var client = new Client();

  Future<List<Hemocentro>> get() async {
    var response = await client
        .get('https://sangue-bom-web-app.azurewebsites.net/api/hemocentro');

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List<dynamic>;
      var hemocentros = new List<Hemocentro>();
      var horarios = new List<HorarioAgendamento>();

      for (dynamic item in list) {
        var hemocentro = new Hemocentro();
        hemocentro.id = item["id"];
        hemocentro.nome = item["nome"];
        hemocentro.horarios = [];
        for (dynamic horario in item["horariosAtendimento"] as List) {
          var hr = HorarioAgendamento();
          hr.horaInicio = DateTime.parse(horario["horaInicio"]);
          hr.horaFim = DateTime.parse(horario["horaFim"]);
          hemocentro.horarios.add(hr);
        }

        hemocentros.add(hemocentro);
      }

      return hemocentros;
    } else {
      throw Exception('Deu Ruim');
    }
  }

  Future<int> post(Hemocentro obj) async {
    var objSerializado =
        json.encode({"nome": obj.nome, "email": obj.email, "senha": obj.senha});

    var response = await client.post(
        "https://sangue-bom-web-app.azurewebsites.net/api/hemocentro",
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
