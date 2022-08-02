// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'package:grupolias/Perfil/models/servicios.model.dart';
import 'package:grupolias/Tickets/models/ciudad.model.dart';

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
    this.ciudadesCobertura,
    this.servicio,
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
  List<Ciudad>? ciudadesCobertura;
  List<Servicio>? servicio;

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
        ciudadesCobertura: json["Ciudades_Cobertura"] == null
            ? null
            : List<Ciudad>.from(
                json["Ciudades_Cobertura"].map((x) => Ciudad.fromJson(x))),
        servicio: json["Servicio"] == null
            ? null
            : List<Servicio>.from(
                json["Servicio"].map((x) => Servicio.fromJson(x))),
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
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "Ciudades_Cobertura": ciudadesCobertura == null
            ? null
            : List<dynamic>.from(ciudadesCobertura!.map((x) => x.toJson())),
        "Servicio": servicio == null
            ? null
            : List<dynamic>.from(servicio!.map((x) => x.toJson())),
      };
}
