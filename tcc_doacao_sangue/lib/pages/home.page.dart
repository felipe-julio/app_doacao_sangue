import 'package:flutter/material.dart';
import 'package:tcc_doacao_sangue/pages/agendamento-list.page.dart';
import 'agendamento-pessoa-list.page.dart';
import 'agendamento.page.dart';
import 'feed.page.dart';
import 'info.page.dart';
import 'mapa.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  final _pageOptions = [
    FeedPage(),
    AgendamentoPage(),
    ListaAgendamentoPessoaPage(),
    MapaPage(),
    InfoPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Feed'),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_agenda),
            title: Text('Agendar'),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Agendamentos'),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Mapa'),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Informações'),
            backgroundColor: Colors.red,
          )
        ],
      ),
    );
  }
}
