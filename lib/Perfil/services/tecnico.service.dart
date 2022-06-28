import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../constants.dart';
import '../../Global/widgets/custom.snackbar.dart';
import '../models/tecnico.model.dart';

import 'package:http/http.dart' as http;

class TecnicoService {
  String url = '${Constants.API_URL}/tecnicos';

  Future<Tecnico?> getTecnicoByUserId(int id) async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');

    var response = await http.get(Uri.parse('$url/user/$id'),
        headers: token != null ? {'Authorization': 'Bearer $token'} : null);

    if (response.statusCode == 200) {
      return Tecnico.fromRawJson(response.body);
    } else {
      CustomSnackBar(
        titulo: "Error: ${response.statusCode}",
        descripcion: "Error al consultar el tecnico actual",
        color: Colors.red,
      );
      return null;
    }
  }
}
