import 'dart:convert';

import 'package:http/http.dart';
import 'package:tcc_doacao_sangue/models/usuario.model.dart';

class UsuarioRepository {
  var client = new Client();

  Future<bool> logar(Usuario usuario) async {
    var objSerializado =
        json.encode({"email": usuario.usuarioNome, "senha": usuario.senha});

    var response = await client.post(
        'https://sangue-bom-web-app.azurewebsites.net/api/usuario/logar',
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: objSerializado);

    if (response.statusCode == 200) {
      var logado = json.decode(response.body);

      return logado;
    } else {
      throw Exception('Deu Ruim');
    }
  }
}
