// ignore_for_file: avoid_print, depend_on_referenced_packages, unused_import

import 'dart:convert';

import 'package:grupolias/Cotizaciones/models/cotizacion.model.dart';
import 'package:grupolias/Cotizaciones/models/create-cotizacion.dto.dart';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;

import '../../Global/image.model.dart';
import '../../Global/services/imagenes.service.dart';
import '../../constants.dart';

class CotizacionesService {
  String cotizacionurl = '${Constants.API_URL}/cotizaciones-tecnico';
  String imagenesurl = '${Constants.API_URL}/imagenes';

  Future<Cotizacion?> create(
    CreateCotizacionDto cotizacion,
    bool isAsistenciaVial,
    File preSolucion,
    File fotoLlegada,
    File? fotoPlacas,
  ) async {
    ImagenesService imgService = ImagenesService();
    //Se sube imagen de foto llegada
    Imagen? imgFotoLlegada = await imgService.subirImagen(fotoLlegada);

    //Se sube imagen de pre solucion
    Imagen? imgPresolucion = await imgService.subirImagen(preSolucion);

    //Si el  ticket es vial
    //Se sube imagen de foto placas

    Imagen? imgPlacas;
    if (isAsistenciaVial) {
      imgPlacas = await imgService.subirImagen(fotoPlacas!);
    }

    if (imgFotoLlegada != null) cotizacion.imgLlegadaId = imgFotoLlegada.id;
    if (imgPlacas != null) cotizacion.imgPlacasId = imgPlacas.id;
    if (imgPresolucion != null) cotizacion.preSolucionId = imgPresolucion.id;

    var resCotizacion = await http.post(
      Uri.parse(cotizacionurl),
      body: cotizacion.toRawJson(),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    print(resCotizacion.body.toString());

    if (resCotizacion.statusCode == 201) {
      return Cotizacion.fromJson(jsonDecode(resCotizacion.body));
    } else {
      throw ("Error al crear la cotización");
    }
  }

  Future<Cotizacion?> getCotizacionByTicket(int idTicket) async {
    var url = '$cotizacionurl/ticket/$idTicket';
    var res = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (res.statusCode == 200) {
      return Cotizacion.fromJson(jsonDecode(res.body));
    } else {
      print(res.body);
      return null;
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
      return null;
    }
  }
}
