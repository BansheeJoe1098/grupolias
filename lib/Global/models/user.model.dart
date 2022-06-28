// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

class User {
  User({
    this.id,
    this.usuario,
    this.email,
    this.password,
    this.inactivo,
    this.createdAt,
    this.updatedAt,
    this.rol,
    this.imgPerfilId,
    this.hashedRt,
  });

  int? id;
  String? usuario;
  String? email;
  String? password;
  bool? inactivo;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? rol;
  int? imgPerfilId;
  String? hashedRt;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        usuario: json["usuario"] == null ? null : json["usuario"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        inactivo: json["inactivo"] == null ? null : json["inactivo"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        rol: json["rol"] == null ? null : json["rol"],
        imgPerfilId: json["img_perfilId"] == null ? null : json["img_perfilId"],
        hashedRt: json["hashedRt"] == null ? null : json["hashedRt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "usuario": usuario == null ? null : usuario,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "inactivo": inactivo == null ? null : inactivo,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "rol": rol == null ? null : rol,
        "img_perfilId": imgPerfilId == null ? null : imgPerfilId,
        "hashedRt": hashedRt == null ? null : hashedRt,
      };
}
