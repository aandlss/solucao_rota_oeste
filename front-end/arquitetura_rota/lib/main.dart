import 'package:arquitetura_rota/telas/tela_login.dart';
import 'package:arquitetura_rota/telas/tela_mobile.dart';
import 'package:arquitetura_rota/telas/tela_principal.dart';
import 'package:arquitetura_rota/telas/tela_ultimos_alertas.dart';
import 'package:arquitetura_rota/telas/teste.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TelaLogin(),
        '/home': (context) => ScreenTypeLayout.builder(
          breakpoints: ScreenBreakpoints(
              tablet: 600,
              desktop: 950,
              watch: 300
          ),
          desktop: (context) => TelaPrincipal(),
          tablet: (context) => TelaPrincipalMobile(),
          mobile: (context) => TelaPrincipalMobile(),
        ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

