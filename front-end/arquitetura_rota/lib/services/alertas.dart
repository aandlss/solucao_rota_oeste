import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:arquitetura_rota/alertas.dart';

class AlertaUtils {
  final String _baseUrl = 'http://127.0.0.1:8000';

  Future<Map<String, dynamic>> buscarAlertas(String token, {int pageNumber = 1, int pageSize = 10}) async {
    try {
      var url = '$_baseUrl/Alert/GetAlerts?pageNumber=$pageNumber&pageSize=$pageSize';

      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Alerta> listaAlertas = (data['alerts'] as List).map<Alerta>((item) => Alerta.fromJson(item)).toList();
        return {
          'alertas': listaAlertas,
        };
      } else {
        throw Exception('Erro: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }
}