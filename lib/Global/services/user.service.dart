import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grupolias/Global/widgets/custom.snackbar.dart';
import 'package:http/http.dart' as http;

import 'package:grupolias/constants.dart';

import '../models/user.model.dart';

class UserService {
  String url = '${Constants.API_URL}/users';

  Future<User?> getUsuarioLogueado() async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');

    var response = await http.get(Uri.parse('$url/usuario-logueado'),
        headers: token != null ? {'Authorization': 'Bearer $token'} : null);

    if (response.statusCode == 200) {
      var user = User.fromRawJson(response.body);

      //Se refresca el token
      const storage = FlutterSecureStorage();
      storage.delete(key: 'token');
      storage.write(key: 'token', value: user.hashedRt);

      return user;
    } else {
      CustomSnackBar(
        titulo: "Error: ${response.statusCode}",
        descripcion: "Error al consultar el usuario actual",
        color: Colors.red,
      );
      return null;
    }
  }

  Future<User?> updateUser(int userId, User user) async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');

    var dio = Dio();

    var data = {
      // "usuario": user.usuario,
      // "email": user.email,
      // "password": user.password,
      "img_perfilId": user.imgPerfilId,
    };

    Response<String> response = await dio.patch(
      "$url/$userId",
      data: data,
      options: Options(
        contentType: 'application/json',
        headers: token != null ? {'Authorization': 'Bearer $token'} : null,
      ),
    );

    if (response.statusCode == 200) {
      return User.fromRawJson(response.data.toString());
    } else {
      CustomSnackBar(
        titulo: "Error: ${response.statusCode}",
        descripcion: "Error al actualizar tu usuario",
        color: Colors.red,
      );
      return null;
    }
  }
}
