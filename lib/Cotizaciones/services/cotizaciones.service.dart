// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grupolias/Cotizaciones/models/cotizacion.model.dart';
import 'package:grupolias/Cotizaciones/models/create-cotizacion.dto.dart';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;

import '../../constants.dart';

class CotizacionesService {
  String cotizacionurl = '${Constants.API_URL}/cotizaciones-tecnico';
  String imagenesurl = '${Constants.API_URL}/imagenes';

  Future<Cotizacion?> create(CreateCotizacionDto cotizacion, File foto) async {
    //Se sube la imagen con DIO
    var dio = Dio();
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    //Se toma el nombre y la extensión de la imagen
    String nombreFoto = foto.path.split('/').last;
    String ext = foto.path.split('.').last;

    FormData resFoto = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        foto.path,
        filename: nombreFoto,
        contentType: http_parser.MediaType('image', ext),
      ),
    });

    var res = await dio.post("$imagenesurl/upload", data: resFoto);
    print(res.data);

    if (res.statusCode == 201) {
      cotizacion.preSolucionId = res.data!["id"];
      var resCotizacion = await http.post(
        Uri.parse(cotizacionurl),
        body: cotizacion.toRawJson(),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      print(resCotizacion.body);

      if (resCotizacion.statusCode == 201) {
        return Cotizacion.fromJson(jsonDecode(resCotizacion.body));
      } else {
        throw ("Error al crear la cotización");
      }
    } else {
      throw Exception("Error al subir la imagen");
    }
  }

  Future<Cotizacion?> statusCotizacion(int idCotizacion) async {
    var url = '$cotizacionurl/$idCotizacion/status';
    var res = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (res.statusCode == 200) {
      return Cotizacion.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Error al obtener las cotizaciones");
    }
  }
}
