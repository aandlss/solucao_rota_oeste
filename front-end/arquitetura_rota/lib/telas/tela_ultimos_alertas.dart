import 'package:arquitetura_rota/secoes/corpo_tela.dart';
import 'package:flutter/material.dart';

class TelaUltimosAlertas extends StatelessWidget {
  const TelaUltimosAlertas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CorpoTela(
      "Últimos Alertas",
      //SUBSTITUA A SIZEDBOX ABAIXO PELO CONTEUDO DO BLOCO BRANCO
      filho: SizedBox(),
    );
  }
}
