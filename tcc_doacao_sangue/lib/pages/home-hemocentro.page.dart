import 'package:flutter/material.dart';
import 'package:tcc_doacao_sangue/pages/agendamento-pessoa-list.page.dart';
import 'agendamento-list.page.dart';
import 'feed.page.dart';
import 'info.page.dart';

class HomeHemocentroPage extends StatefulWidget {
  @override
  _HomeHemocentroPageState createState() => _HomeHemocentroPageState();
}

class _HomeHemocentroPageState extends State<HomeHemocentroPage> {
  int _selectedPage = 0;
  final _pageOptions = [FeedPage(), ListaAgendamentoPessoaPage(), InfoPage()];

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
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              'Feed',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_agenda,
              color: Colors.white,
            ),
            title: Text(
              'Agendamentos',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: Text(
              'Informações',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.white,
          )
        ],
      ),
    );
  }
}
