import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:grupolias/Cotizaciones/model/cotizacion.model.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../constants.dart';

class CotizacionesService {
  String cotizacionurl = '${Constants.API_URL}/cotizaciones-tecnico';
  String imagenesurl = '${Constants.API_URL}/imagenes';

  Future<Cotizacion?> create(Cotizacion cotizacion, File foto) async {
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
        contentType: MediaType('image', ext),
      ),
    });

    var res = await dio.post("$imagenesurl/upload", data: resFoto);

    if (res.statusCode == 201) {
      cotizacion.preSolucionId = res.data!["id"];

      var resCotizacion = await http.post(
        Uri.parse(cotizacionurl),
        body: cotizacion.toRawJson(),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      if (resCotizacion.statusCode == 201) {
        return Cotizacion.fromJson(jsonDecode(resCotizacion.body));
      } else {
        throw ("Error al crear la cotización");
      }
    } else {
      throw Exception("Error al subir la imagen");
    }
  }
}
