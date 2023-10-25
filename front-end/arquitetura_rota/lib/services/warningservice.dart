// lib/services/warningservice.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:arquitetura_rota/alertas.dart';

class WarningService {
  final String _baseUrl = 'http://127.0.0.1:8000';

  Future<Map<String, dynamic>> pegaAlertas(String token, {int pageNumber = 1, int pageSize = 10, String? type, String? color, String? severity, DateTime? date}) async {
    try {
      var url = '$_baseUrl/Alert/GetAlerts?pageNumber=$pageNumber&pageSize=$pageSize';
      if (type != null) {
        url += '&type=$type';
      }
      if (color != null) {
        url += '&color=$color';
      }
      if (severity != null) {
        url += '&severity=$severity';
      }
      if (date != null) {
        url += '&date=${date.toIso8601String()}';
      }

      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Alerta> alertas = (data['alerts'] as List).map<Alerta>((item) => Alerta.fromJson(item)).toList();
        return {
          'count': data['count'],
          'hasMore': data['hasMore'],
          'alertas': alertas,
        };
      } else {
        throw Exception('Failed to fetch warnings, status code: ${response.statusCode}, body: ${response.body}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception: $e');
      rethrow;
    }
  }
}