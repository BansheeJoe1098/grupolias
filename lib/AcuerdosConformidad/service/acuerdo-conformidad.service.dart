import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:grupoLias/Tickets/service/ticket.service.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';
import 'package:http_parser/http_parser.dart';

import '../../constants.dart';
import '../model/acuerdo-conformidad.dto.dart';

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
}
