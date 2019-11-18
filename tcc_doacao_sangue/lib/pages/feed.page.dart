import 'package:flutter/material.dart';
import 'package:tcc_doacao_sangue/models/feed.model.dart';
import 'package:tcc_doacao_sangue/repositories/feed.repository.dart';
import 'package:tcc_doacao_sangue/widgets/connection-manager.widget.dart';
import 'package:tcc_doacao_sangue/widgets/feed-doacao.widget.dart';

class FeedPage extends StatelessWidget {
  final feedRepository = new FeedRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/CadastroFeed");
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Feed"),
        ),
        body: ConnectionManager(
          future: feedRepository.get(),
          func: listarFeeds,
          progressIndicator: true,
        ),
      ),
    );
  }

  Widget listarFeeds(BuildContext context, AsyncSnapshot snapshot) {
    List<Feed> feeds = snapshot.data;

    return ListView.builder(
      itemCount: feeds.length,
      itemBuilder: (BuildContext ctx, int index) {
        return FeedDoacao(
          imagem: feeds[index].imagem,
          descricao: feeds[index].descricao,
        );
      },
    );
  }
}
