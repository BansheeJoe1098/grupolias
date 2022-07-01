// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grupolias/Global/image.model.dart';

import '../../Tickets/models/ciudad.model.dart';
import '../../Tickets/models/estado.model.dart';
import '../../constants.dart';
import '../../Global/widgets/custom.snackbar.dart';
import '../models/tecnico.model.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;

class TecnicoService {
  String url = '${Constants.API_URL}/tecnicos';
  String imagenesURL = '${Constants.API_URL}/imagenes';
  String ciudadURL = '${Constants.API_URL}/ciudades';
  String estadosURL = '${Constants.API_URL}/estados';

  Future<Tecnico?> getTecnicoByUserId(int id) async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');

    var response = await http.get(Uri.parse('$url/user/$id'),
        headers: token != null ? {'Authorization': 'Bearer $token'} : null);

    if (response.statusCode == 200) {
      return Tecnico.fromRawJson(response.body);
    } else {
      CustomSnackBar(
        titulo: "Error: ${response.statusCode}",
        descripcion: "Error al consultar el tecnico actual",
        color: Colors.red,
      );
      return null;
    }
  }

  Future<Imagen?> updateFotoPerfil(int id, File foto) async {
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

  Future<Imagen?> getImagenPerfil(int imageProfileId) async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    final response = await http.get(
      Uri.parse('$imagenesURL/$imageProfileId'),
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

  Future<Ciudad?> getCiudadTecnico(int idCiudad) async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');

    final response = await http.get(
      Uri.parse('$ciudadURL/$idCiudad'),
      headers: token != null ? {'Authorization': 'Bearer $token'} : null,
    );

    if (response.statusCode == 200) {
      return Ciudad.fromRawJson(response.body);
    } else {
      CustomSnackBar(
        titulo: "Error al obtener la ciudad",
        descripcion: "Error: ${response.statusCode}",
        color: Colors.red,
      );

      return null;
    }
  }

  Future<Estado?> getEstadoTecnico(int idEstado) async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');

    final response = await http.get(
      Uri.parse('$estadosURL/$idEstado'),
      headers: token != null ? {'Authorization': 'Bearer $token'} : null,
    );

    if (response.statusCode == 200) {
      return Estado.fromRawJson(response.body);
    } else {
      CustomSnackBar(
        titulo: "Error al obtener la ciudad",
        descripcion: "Error: ${response.statusCode}",
        color: Colors.red,
      );

      return null;
    }
  }
}
