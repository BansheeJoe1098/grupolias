// To parse this JSON data, do
//
//     final ciudad = ciudadFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, prefer_if_null_operators

import 'dart:convert';

import 'estado.model.dart';

class Ciudad {
  Ciudad({
    this.id,
    this.nombre,
    this.latitud,
    this.longitud,
    this.estadoId,
    this.createdAt,
    this.updatedAt,
    this.estado,
  });

  int? id;
  String? nombre;
  double? latitud;
  double? longitud;
  int? estadoId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Estado? estado;

  factory Ciudad.fromRawJson(String str) => Ciudad.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ciudad.fromJson(Map<String, dynamic> json) => Ciudad(
        id: json["id"] == null ? null : json["id"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        latitud: json["latitud"] == null ? null : json["latitud"].toDouble(),
        longitud: json["longitud"] == null ? null : json["longitud"].toDouble(),
        estadoId: json["estadoId"] == null ? null : json["estadoId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        estado: json["Estado"] == null ? null : Estado.fromJson(json["Estado"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nombre": nombre == null ? null : nombre,
        "latitud": latitud == null ? null : latitud,
        "longitud": longitud == null ? null : longitud,
        "estadoId": estadoId == null ? null : estadoId,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "Estado": estado == null ? null : estado?.toJson(),
      };
}
