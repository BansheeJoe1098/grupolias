// To parse this JSON data, do
//
//     final imagen = imagenFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

class Imagen {
  Imagen({
    this.id,
    this.url,
    this.descripcion,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? url;
  String? descripcion;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Imagen.fromRawJson(String str) => Imagen.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        descripcion: json["descripcion"] == null ? null : json["descripcion"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "descripcion": descripcion == null ? null : descripcion,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
