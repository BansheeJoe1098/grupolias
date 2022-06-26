// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart' as http_parser;

import '../../constants.dart';

class SignatureService {
  String url = '${Constants.API_URL}/acuerdos-conformidad';

  Future<String?> create(int idAcuerdo, File file) async {
    var dio = Dio();
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;

    //Se toma el nombre y la extensión de la imagen
    String nombreFoto = file.path.split('/').last;
    String ext = file.path.split('.').last;

    FormData resfile = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: nombreFoto,
        contentType: http_parser.MediaType('image', ext),
      ),
    });

    var res = await dio.post("$url/$idAcuerdo/acuerdo-firmado", data: resfile);

    if (res.statusCode == 201) {
      return res.data.toString();
    } else {
      return null;
    }
  }
}
