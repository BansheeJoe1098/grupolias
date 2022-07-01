// ignore_for_file: unused_import, depend_on_referenced_packages

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../constants.dart';
import '../../Global/widgets/custom.snackbar.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;

import '../image.model.dart';

class ImagenesService {
  String imagenesURL = '${Constants.API_URL}/imagenes';
  Future<Imagen?> subirImagen(File foto) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    var token = await storage.read(key: 'token');
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

    Response<String> res = await dio.post(
      "$imagenesURL/upload",
      data: resFoto,
      options: Options(
        headers: token != null ? {'Authorization': 'Bearer $token'} : null,
        responseType: ResponseType.json,
      ),
    );

    if (res.statusCode == 201) {
      Imagen imagen = Imagen.fromRawJson(res.data.toString());
      return imagen;
    } else {
      CustomSnackBar(
        titulo: "Error: ${res.statusCode}",
        descripcion: "Error al subir la imagen",
        color: Colors.red,
      );
      return null;
    }
  }

  Future<Imagen?> getImagen(int idImagen) async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    final response = await http.get(
      Uri.parse('$imagenesURL/$idImagen'),
      headers: token != null ? {'Authorization': 'Bearer $token'} : null,
    );

    if (response.statusCode == 200) {
      return Imagen.fromRawJson(response.body);
    } else {
      CustomSnackBar(
        titulo: "Error al obtener la foto de perfil",
        descripcion: "Error: ${response.statusCode}",
        color: Colors.red,
      );

      return null;
    }
  }
}
