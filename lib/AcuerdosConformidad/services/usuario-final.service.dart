import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grupolias/AcuerdosConformidad/models/acuerdo-final.model.dart';
import 'package:grupolias/AcuerdosConformidad/models/dto/usuario-final-dto.model.dart';
import 'package:grupolias/Global/widgets/custom.snackbar.dart';

import '../../constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioFinalService {
  String url = '${Constants.API_URL}/usuarios-finales';

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
