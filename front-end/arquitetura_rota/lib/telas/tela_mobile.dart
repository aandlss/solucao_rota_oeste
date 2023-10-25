import 'package:arquitetura_rota/telas/ultimos_alertas_mobile.dart';
import 'package:arquitetura_rota/secoes/corpo_tela_mobile.dart';
import 'package:arquitetura_rota/secoes/cabecalho_mobile.dart';
import 'package:arquitetura_rota/componentes/card_alerta_mobile.dart';
import 'package:arquitetura_rota/alertas.dart';
import 'package:arquitetura_rota/services/warningservice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class TelaPrincipalMobile extends StatefulWidget {
  const TelaPrincipalMobile({Key? key}) : super(key: key);

  @override
  _TelaPrincipalMobileState createState() => _TelaPrincipalMobileState();
}

class _TelaPrincipalMobileState extends State<TelaPrincipalMobile> {
  List<Alerta> alertas = [];

  final _warningService = WarningService();

  Future<Map<String, dynamic>> _warningsFuture = Future.value({});

  Future<void> buscaAlertas() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token') ?? '';
    _warningsFuture = _warningService.pegaAlertas(
      token,
    );
    _warningsFuture.then((data) {
      alertas = data['alertas'];
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    buscaAlertas();
  }

  String AjustaTextoPrioridade(String prioridade) {
    switch (prioridade) {
      case 'CRITICAL' || 'HIGH':
        return 'ALTA';
      case 'MEDIUM':
        return 'MÉDIA';
      case 'UNKNOW':
        return 'DESCONHECIDA';
      case 'LOW':
        return 'BAIXA';
      default:
        return prioridade;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        CabecalhoMobile(),
        CorpoTelaMobile(
          'Ultimos Alertas',
          filho: Expanded(
            child: SingleChildScrollView(child: FutureBuilder<Map<String, dynamic>>(
              future: _warningsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Um erro aconteceu. Tente novamente.'));
                } else {
                  List<Alerta> alertasParaExibicao = snapshot.data!['alertas'];
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: alertasParaExibicao.length,
                      itemBuilder: (context, i) {
                        Alerta alertaAtual = alertasParaExibicao[i];
                        return CardAlertaMobile(
                            modelo: alertaAtual.definitionId.toString(),
                            prioridade:
                            AjustaTextoPrioridade(alertaAtual.severity),
                            alerta: alertaAtual.definitionDescription,
                            data:
                            '${alertaAtual.time.day.toString()}/${alertaAtual.time.month.toString()}/${alertaAtual.time.hour.toString()}',
                            hora:
                            '${alertaAtual.time.hour.toString()}:${alertaAtual.time.minute.toString()}');
                      });
                }
              },
            ),),
          )
        ),
      ]),
    );
  }
}

/*
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
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
    ),
  );
 */
