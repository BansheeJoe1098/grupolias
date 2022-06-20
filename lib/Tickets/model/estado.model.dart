// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

class Estado {
  Estado({
    this.id,
    this.nombre,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? nombre;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Estado.fromRawJson(String str) => Estado.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        id: json["id"] == null ? null : json["id"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nombre": nombre == null ? null : nombre,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
