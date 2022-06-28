// To parse this JSON data, do
//
//     final tecnico = tecnicoFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

import 'package:grupolias/Perfil/models/servicios.model.dart';

import '../../Tickets/models/ciudad.model.dart';

class Tecnico {
  Tecnico({
    this.id,
    this.nombre,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.calificacion,
    this.telefono,
    this.usuarioId,
    this.ciudadId,
    this.createdAt,
    this.updatedAt,
    this.servicio,
    this.ciudad,
  });

  int? id;
  String? nombre;
  String? apellidoPaterno;
  String? apellidoMaterno;
  int? calificacion;
  String? telefono;
  int? usuarioId;
  int? ciudadId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Servicio>? servicio;
  List<Ciudad>? ciudad;

  factory Tecnico.fromRawJson(String str) => Tecnico.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tecnico.fromJson(Map<String, dynamic> json) => Tecnico(
        id: json["id"] == null ? null : json["id"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        apellidoPaterno:
            json["apellido_paterno"] == null ? null : json["apellido_paterno"],
        apellidoMaterno:
            json["apellido_materno"] == null ? null : json["apellido_materno"],
        calificacion:
            json["calificacion"] == null ? null : json["calificacion"],
        telefono: json["telefono"] == null ? null : json["telefono"],
        usuarioId: json["usuarioId"] == null ? null : json["usuarioId"],
        ciudadId: json["ciudadId"] == null ? null : json["ciudadId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        servicio: json["Servicio"] == null
            ? null
            : List<Servicio>.from(
                json["Servicio"].map((x) => Servicio.fromJson(x))),
        ciudad: json["Ciudad"] == null
            ? null
            : List<Ciudad>.from(json["Ciudad"].map((x) => Ciudad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nombre": nombre == null ? null : nombre,
        "apellido_paterno": apellidoPaterno == null ? null : apellidoPaterno,
        "apellido_materno": apellidoMaterno == null ? null : apellidoMaterno,
        "calificacion": calificacion == null ? null : calificacion,
        "telefono": telefono == null ? null : telefono,
        "usuarioId": usuarioId == null ? null : usuarioId,
        "ciudadId": ciudadId == null ? null : ciudadId,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "Servicio": servicio == null
            ? null
            : List<dynamic>.from(servicio!.map((x) => x.toJson())),
        "Ciudad": ciudad == null
            ? null
            : List<dynamic>.from(ciudad!.map((x) => x.toJson())),
      };
}
