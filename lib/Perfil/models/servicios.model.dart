// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

class Servicio {
  Servicio({
    this.id,
    this.nombre,
    this.createdAt,
    this.updatedAt,
    this.tipo,
  });

  int? id;
  String? nombre;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? tipo;

  factory Servicio.fromRawJson(String str) =>
      Servicio.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
        id: json["id"] == null ? null : json["id"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        tipo: json["tipo"] == null ? null : json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nombre": nombre == null ? null : nombre,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "tipo": tipo == null ? null : tipo,
      };
}
