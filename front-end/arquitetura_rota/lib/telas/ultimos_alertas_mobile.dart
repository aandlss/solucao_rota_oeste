import 'package:arquitetura_rota/componentes/cabecalho_alerta.dart';
import 'package:arquitetura_rota/componentes/card_alerta.dart';
import 'package:arquitetura_rota/secoes/corpo_tela.dart';
import 'package:arquitetura_rota/alertas.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:arquitetura_rota/services/warningservice.dart';
import 'package:flutter/material.dart';

class TelaUltimosAlertasMobile extends StatefulWidget {
  const TelaUltimosAlertasMobile({Key? key}) : super(key: key);

  @override
  _TelaUltimosAlertasMobileState createState() => _TelaUltimosAlertasMobileState();
}

class _TelaUltimosAlertasMobileState extends State<TelaUltimosAlertasMobile> {
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
        filho: Text('Oi'));
  }
}
