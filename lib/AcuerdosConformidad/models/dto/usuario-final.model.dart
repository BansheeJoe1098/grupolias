// To parse this JSON data, do

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

// To parse this JSON data, do
//
//     final usuarioFinal = usuarioFinalFromJson(jsonString);

// To parse this JSON data, do
//
//     final usuarioFinal = usuarioFinalFromJson(jsonString);

import 'dart:convert';

class UsuarioFinal {
  UsuarioFinal({
    this.id,
    this.nombre,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.createdAt,
    this.correo,
    this.telefono,
    this.updatedAt,
  });

  int? id;
  String? nombre;
  String? apellidoPaterno;
  String? apellidoMaterno;
  DateTime? createdAt;
  String? correo;
  String? telefono;
  DateTime? updatedAt;

  factory UsuarioFinal.fromRawJson(String str) =>
      UsuarioFinal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsuarioFinal.fromJson(Map<String, dynamic> json) => UsuarioFinal(
        id: json["id"] == null ? null : json["id"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        apellidoPaterno:
            json["apellido_paterno"] == null ? null : json["apellido_paterno"],
        apellidoMaterno:
            json["apellido_materno"] == null ? null : json["apellido_materno"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        correo: json["correo"] == null ? null : json["correo"],
        telefono: json["telefono"] == null ? null : json["telefono"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nombre": nombre == null ? null : nombre,
        "apellido_paterno": apellidoPaterno == null ? null : apellidoPaterno,
        "apellido_materno": apellidoMaterno == null ? null : apellidoMaterno,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "correo": correo == null ? null : correo,
        "telefono": telefono == null ? null : telefono,
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
