import "dart:convert";
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

class AuthService {
  final String _baseUrl = 'http://127.0.0.1:8000';

  Future<String> login(String username, String password) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/Auth/login'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            // body: jsonEncode(<String, String>{
            //   'username': username,
            //   'password': password,
            // }),
            body: jsonEncode(<String, String>{
              'username': 'admin',
              'password': '@Senha1234',
            }),
          )
          .timeout(const Duration(seconds: 100));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String jwtToken = data['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', jwtToken);
        return jwtToken;
      } else {
        throw Exception('Erro no login');
      }
    } catch (e) {
      rethrow;
    }
  }
}