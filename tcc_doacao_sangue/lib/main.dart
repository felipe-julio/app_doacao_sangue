import 'package:flutter/material.dart';
import 'package:tcc_doacao_sangue/pages/agendamento.page.dart';
import 'package:tcc_doacao_sangue/pages/cadastro-feed.page.dart';
import 'package:tcc_doacao_sangue/pages/cadastro-hemocentro.page.dart';
import 'package:tcc_doacao_sangue/pages/feed.page.dart';
import 'package:tcc_doacao_sangue/pages/home-hemocentro.page.dart';
import 'package:tcc_doacao_sangue/pages/home.page.dart';
import 'package:tcc_doacao_sangue/pages/info.page.dart';
import 'package:tcc_doacao_sangue/pages/logado.dart';
import 'package:tcc_doacao_sangue/pages/login.page.dart';
import 'package:tcc_doacao_sangue/pages/mapa.page.dart';
import 'package:tcc_doacao_sangue/pages/tipo-cadastro.page.dart';

import 'pages/cadastro-pessoa.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sangue Bom',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/Home': (context) => HomePage(),
        '/logado': (context) => Logado(),
        '/CadastrarPessoa': (context) => CadastroPessoaPage(),
        '/CadastrarHemocentro': (context) => CadastroHemocentroPage(),
        '/Mapa': (context) => MapaPage(),
        '/Info': (context) => InfoPage(),
        '/Feed': (context) => FeedPage(),
        '/Agendamento': (context) => AgendamentoPage(),
        '/TipoCadastro': (context) => TipoCadastroPage(),
        '/CadastroFeed': (context) => CadastroFeed(),
        '/HomeHemocentro': (context) => HomeHemocentroPage()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
