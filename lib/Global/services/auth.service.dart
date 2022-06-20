import 'package:grupolias/Global/models/token.model.dart';
import 'package:http/http.dart' as http;

import 'package:grupolias/constants.dart';

class AuthService {
  String url = '${Constants.API_URL}/auth';

  Future<Token?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$url/login'),
      body: {
        'usuario': email,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      var token = Token.fromRawJson(response.body);
      return token;
    }
    return null;
  }

  Future<bool> checkSession(String? token) async {
    var response = await http.get(Uri.parse('$url/sayhi'),
        headers: token != null ? {'Authorization': 'Bearer $token'} : null);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
