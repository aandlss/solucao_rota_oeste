import 'package:arquitetura_rota/componentes/cabecalho_alerta.dart';
import 'package:arquitetura_rota/componentes/card_alerta.dart';
import 'package:arquitetura_rota/secoes/corpo_tela.dart';
import 'package:arquitetura_rota/alertas.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arquitetura_rota/services/warningservice.dart';
import 'package:flutter/material.dart';

class TelaUltimosAlertas extends StatefulWidget {
  const TelaUltimosAlertas({Key? key}) : super(key: key);

  @override
  _TelaUltimosAlertasState createState() => _TelaUltimosAlertasState();
}

class _TelaUltimosAlertasState extends State<TelaUltimosAlertas> {
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
    return CorpoTela("Últimos Alertas",
        filho: Expanded(  
          child: Column(children: <Widget>[
            CabecalhoAlerta(),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder<Map<String, dynamic>>(
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
                            return CardAlerta(
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
                ),
              ),
            ),
          ]),
        ));
  }
}
