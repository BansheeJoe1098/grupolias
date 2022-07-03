// To parse this JSON data, do
//
//     final usuarioFinalDto = usuarioFinalDtoFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

class UsuarioFinalDto {
  UsuarioFinalDto({
    this.nombre,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.correo,
    this.telefono,
  });

  String? nombre;
  String? apellidoPaterno;
  String? apellidoMaterno;
  String? correo;
  String? telefono;

  factory UsuarioFinalDto.fromRawJson(String str) =>
      UsuarioFinalDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsuarioFinalDto.fromJson(Map<String, dynamic> json) =>
      UsuarioFinalDto(
        nombre: json["nombre"] == null ? null : json["nombre"],
        apellidoPaterno:
            json["apellido_paterno"] == null ? null : json["apellido_paterno"],
        apellidoMaterno:
            json["apellido_materno"] == null ? null : json["apellido_materno"],
        correo: json["correo"] == null ? null : json["correo"],
        telefono: json["telefono"] == null ? null : json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre == null ? null : nombre,
        "apellido_paterno": apellidoPaterno == null ? null : apellidoPaterno,
        "apellido_materno": apellidoMaterno == null ? null : apellidoMaterno,
        "correo": correo == null ? null : correo,
        "telefono": telefono == null ? null : telefono,
      };
}
