import 'package:flutter/material.dart';
import 'package:sangue_bom_app/pages/agendamento.page.dart';
import 'package:sangue_bom_app/pages/cadastro.page.dart';
import 'package:sangue_bom_app/pages/feed.page.dart';
import 'package:sangue_bom_app/pages/home.page.dart';
import 'package:sangue_bom_app/pages/info.page.dart';
import 'package:sangue_bom_app/pages/logado.dart';
import 'package:sangue_bom_app/pages/login.page.dart';
import 'package:sangue_bom_app/pages/mapa.page.dart';

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
        '/CadastrarUsuario': (context) => CadastroPage(),
        '/Mapa': (context) => MapaPage(),
        '/Info': (context) => InfoPage(),
        '/Feed': (context) => FeedPage(),
        '/Agendamento': (context) => AgendamentoPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
