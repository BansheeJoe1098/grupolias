import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grupolias/AcuerdosConformidad/models/dto/usuario-final-dto.model.dart';
import 'package:grupolias/AcuerdosConformidad/models/dto/usuario-final.model.dart';
import 'package:grupolias/Global/widgets/custom.snackbar.dart';

import '../../constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioFinalService {
  String url = '${Constants.API_URL}/usuarios-finales';

  Future<UsuarioFinal?> getByTelefono(String telefono) async {
    var response = await http.get(Uri.parse("$url/telefono/$telefono"));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      CustomSnackBar(
        titulo: "El usuario ya fué registrado anteriormente",
        descripcion: "Puedes continuar con la cotizacion",
        color: Colors.green,
      );
      return UsuarioFinal.fromJson(data);
    } else {
      CustomSnackBar(
        titulo: "Este usuario final no existe",
        descripcion:
            "Verifique con el usuario el telefono, de lo contario por favor llene los campos siguientes",
        color: Colors.orange,
      );
      return null;
    }
  }

  Future<UsuarioFinal?> create(UsuarioFinalDto acuerdoConformidad) async {
    var response = await http.post(
      Uri.parse(url),
      body: acuerdoConformidad.toRawJson(),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    if (response.statusCode == 201) {
      return UsuarioFinal.fromJson(jsonDecode(response.body));
    } else {
      CustomSnackBar(
        titulo: "Error",
        descripcion: List.from(jsonDecode(response.body)['message'])
            .map((e) => e.toString())
            .join('\n'),
        color: Colors.red,
      );
    }
    return null;
  }
}
