import 'package:arquitetura_rota/extensoes.dart';
import 'package:arquitetura_rota/secoes/cabecalho.dart';
import 'package:arquitetura_rota/secoes/secao_menu.dart';
import 'package:arquitetura_rota/telas/tela_resultado_pesquisa.dart';
import 'package:arquitetura_rota/telas/tela_ultimos_alertas.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Widget _corpoTela = TelaUltimosAlertas();

  void _navegarParaResultadoPesquisa() {
    setState(() {
      _corpoTela = TelaResultadoPesquisa();
    });
  }

  void _navegarParaUltimosAlertas() {
    setState(() {
      _corpoTela = TelaUltimosAlertas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: '#d9d9d9'.toColor()),
      child: Padding(
        padding: EdgeInsets.fromLTRB(36, 0, 36, 28),
        child: Column(
          children: [
            Cabecalho(onLupaPressed: _navegarParaResultadoPesquisa),
            Expanded(
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Menu(
                      tela: "ultimosalertas", 
                      onUltimosAlertasPressed: _navegarParaUltimosAlertas,
                    ),
                    _corpoTela,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
