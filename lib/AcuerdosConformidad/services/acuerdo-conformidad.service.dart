import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grupolias/Global/widgets/custom.snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:grupolias/AcuerdosConformidad/models/acuerdo-conformidad.model.dart';

import '../../constants.dart';
import '../models/dto/acuerdo-conformidad-dto.model.dart';

class AcuerdoService {
  String acuerdourl = '${Constants.API_URL}/acuerdos-conformidad';
  String imagenenfirmaurl = '${Constants.API_URL}/imagenes';

  Future<AcuerdoConformidad?> create(AcuerdoDto acuerdoConformidad) async {
    var response = await http.post(
      Uri.parse(acuerdourl),
      body: acuerdoConformidad.toRawJson(),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    if (response.statusCode == 201) {
      return AcuerdoConformidad.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<List<AcuerdoConformidad>?> acuerdosconformidadById() async {
    //TODO: Obtener el id del acuerdos-conformidad
    var res = await http.get(
      Uri.parse("$acuerdourl/acuerdos-conformidad/${1}"),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (res.statusCode == 200) {
      var acuerdos = jsonDecode(res.body) as List<dynamic>;
      return acuerdos
          .map((acuerdo) => AcuerdoConformidad.fromJson(acuerdo))
          .toList();
    } else {
      throw Exception("Error al obtener el acuerdo");
    }
  }

  Future<AcuerdoConformidad?> remove(
    AcuerdoConformidad acuerdo,
  ) async {
    var res = await http.delete(
      Uri.parse("$acuerdourl/${acuerdo.id}"),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (res.statusCode == 200) {
      return AcuerdoConformidad.fromJson(jsonDecode(res.body));
    } else {
      CustomSnackBar(
          titulo: "Error",
          descripcion: "No se pudo deshacer el acuerdo, consulte a grupo lias",
          color: Colors.red);
    }
    return null;
  }
}
