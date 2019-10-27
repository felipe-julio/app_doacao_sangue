import 'package:flutter/material.dart';
import 'package:sangue_bom_app/pages/cadastro.page.dart';
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
        '/logado': (context) => Logado(),
        '/CadastrarUsuario': (context) => MapaPage()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
