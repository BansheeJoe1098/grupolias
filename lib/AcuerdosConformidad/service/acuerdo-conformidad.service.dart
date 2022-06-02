import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.dto.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';

import '../../constants.dart';

class AcuerdoService {
  String acuerdourl = '${Constants.API_URL}/acuerdos-conformidad';
  String imagenenfirmaurl = '${Constants.API_URL}/imagenes';

  Future<AcuerdoConformidad?> create(
      CreateAcuerdoConformidadDto acuerdoConformidad, File foto) async {
    var dio = Dio();
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    //Se toma el nombre y la extensión de la imagen
    String nombreFotofirma = foto.path.split('/').last;
    String ext = foto.path.split('.').last;

    FormData resFoto = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        foto.path,
        filename: nombreFotofirma,
        contentType: MediaType('image', ext),
      ),
    });
    var res = await dio.post("$imagenenfirmaurl/upload", data: resFoto);

    if (res.statusCode == 201) {
      acuerdoConformidad.usuarioFinalId = res.data!["id"];
      var resAcuerdosconformidad = await http.post(
        Uri.parse(acuerdourl),
        body: acuerdoConformidad.toRawJson(),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      if (resAcuerdosconformidad.statusCode == 201) {
        return AcuerdoConformidad.fromJson(
            jsonDecode(resAcuerdosconformidad.body));
      } else {
        throw ("Error al crear el acuerdo de conformidad");
      }
    } else {
      throw Exception("Error al subir la imagen");
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
