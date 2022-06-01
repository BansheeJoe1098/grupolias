// To parse this JSON data, do
//
//     final cotizacion = cotizacionFromJson(jsonString);

// ignore_for_file: prefer_null_aware_operators, prefer_if_null_operators

import 'dart:convert';

class Cotizacion {
  Cotizacion({
    this.id,
    this.diagnosticoProblema,
    this.solucionTecnico,
    this.fechaContacto,
    this.costoManoObra,
    this.costoMateriales,
    this.totalCotizacion,
    this.ticketId,
    this.tecnicoId,
    this.preSolucionId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? diagnosticoProblema;
  String? solucionTecnico;
  DateTime? fechaContacto;
  double? costoManoObra;
  double? costoMateriales;
  double? totalCotizacion;
  int? ticketId;
  int? tecnicoId;
  int? preSolucionId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Cotizacion.fromRawJson(String str) =>
      Cotizacion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cotizacion.fromJson(Map<String, dynamic> json) => Cotizacion(
        id: json["id"] == null ? null : json["id"],
        diagnosticoProblema: json["diagnostico_problema"] == null
            ? null
            : json["diagnostico_problema"],
        solucionTecnico:
            json["solucion_tecnico"] == null ? null : json["solucion_tecnico"],
        fechaContacto: json["fecha_contacto"] == null
            ? null
            : DateTime.parse(json["fecha_contacto"]),
        costoManoObra:
            json["costo_mano_obra"] == null ? null : json["costo_mano_obra"],
        costoMateriales:
            json["costo_materiales"] == null ? null : json["costo_materiales"],
        totalCotizacion:
            json["total_cotizacion"] == null ? null : json["total_cotizacion"],
        ticketId: json["ticketId"] == null ? null : json["ticketId"],
        tecnicoId: json["tecnicoId"] == null ? null : json["tecnicoId"],
        preSolucionId:
            json["preSolucionId"] == null ? null : json["preSolucionId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "diagnostico_problema":
            diagnosticoProblema == null ? null : diagnosticoProblema,
        "solucion_tecnico": solucionTecnico == null ? null : solucionTecnico,
        "fecha_contacto":
            fechaContacto == null ? null : fechaContacto?.toIso8601String(),
        "costo_mano_obra":
            costoManoObra == null ? null : costoManoObra?.toDouble(),
        "costo_materiales":
            costoMateriales == null ? null : costoMateriales?.toDouble(),
        "total_cotizacion":
            totalCotizacion == null ? null : totalCotizacion?.toDouble(),
        "ticketId": ticketId == null ? null : ticketId,
        "tecnicoId": tecnicoId == null ? null : tecnicoId,
        "preSolucionId": preSolucionId == null ? null : preSolucionId,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
