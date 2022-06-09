import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:grupoLias/Tickets/model/ticket.model.dart';
import 'package:grupoLias/Tickets/service/ticket.service.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';

import '../../constants.dart';
import '../model/acuerdo-conformidad.dto.dart';
import 'package:grupoLias/Signature_Form/ui/signature.dart';

class AcuerdoService {
  String acuerdourl = '${Constants.API_URL}/acuerdos-conformidad';
  String imagenenfirmaurl = '${Constants.API_URL}/imagenes';

  Future<AcuerdoConformidad?> create(
      AcuerdoDto acuerdoConformidad, File file) async {
    var dio = Dio();
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;

    String nombrefirma = file.path.split('/').last;
    String ext = file.path.split('.').last;

    FormData firmaFoto = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: nombrefirma,
        contentType: MediaType('image', ext),
      ),
    });
    var res = await dio.post("$imagenenfirmaurl/upload", data: firmaFoto);

    var res1 = await http.post(
      Uri.parse(acuerdourl),
      body: acuerdoConformidad.toRawJson(),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    if (res.statusCode == 201) {
      var service = TicketService();
      var resTicket = await service.setACerrar(acuerdoConformidad.ticketId!);

      print(resTicket.toRawJson());
      return AcuerdoConformidad.fromJson(jsonDecode(res1.body));
    } else {
      throw ("Error al crear el acuerdo de conformidad");
    }
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
