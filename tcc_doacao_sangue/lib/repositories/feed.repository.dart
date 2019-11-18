import 'dart:convert';

import 'package:http/http.dart';
import 'package:tcc_doacao_sangue/models/feed.model.dart';

class FeedRepository {
  var client = new Client();

  Future<List<Feed>> get() async {
    var response = await client
        .get('https://sangue-bom-web-app.azurewebsites.net/api/feeds');

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List<dynamic>;
      var feeds = new List<Feed>();

      for (dynamic item in list) {
        var feed = new Feed(item["descricao"], item["imagem64"]);
        feed.id = item["id"];

        feeds.add(feed);
      }

      return feeds;
    } else {
      throw Exception('Deu Ruim');
    }
  }

  Future<int> post(Feed obj) async {
    var objSerializado = json.encode({
      "descricao": obj.descricao,
      "imagem64": obj.imagem64,
    });

    var response = await client.post(
        "https://sangue-bom-web-app.azurewebsites.net/api/feeds",
        headers: {"Content-type": "application/json; charset=UTF-8"},
        body: objSerializado);

    return response.statusCode;
  }
}
