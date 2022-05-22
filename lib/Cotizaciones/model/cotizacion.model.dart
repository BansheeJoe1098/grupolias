// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators
import 'dart:convert';

// To parse this JSON data, do
//
//     final cotizacion = cotizacionFromMap(jsonString);

// To parse this JSON data, do
//
//     final cotizacion = cotizacionFromMap(jsonString);

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
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? diagnosticoProblema;
  String? solucionTecnico;
  int? fechaContacto;
  int? costoManoObra;
  int? costoMateriales;
  int? totalCotizacion;
  int? ticketId;
  int? tecnicoId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Cotizacion.fromJson(String str) =>
      Cotizacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cotizacion.fromMap(Map<String, dynamic> json) => Cotizacion(
        id: json["id"] == null ? null : json["id"],
        diagnosticoProblema: json["diagnostico_problema"] == null
            ? null
            : json["diagnostico_problema"],
        solucionTecnico:
            json["solucion_tecnico"] == null ? null : json["solucion_tecnico"],
        fechaContacto:
            json["fecha_contacto"] == null ? null : json["fecha_contacto"],
        costoManoObra:
            json["costo_mano_obra"] == null ? null : json["costo_mano_obra"],
        costoMateriales:
            json["costo_materiales"] == null ? null : json["costo_materiales"],
        totalCotizacion:
            json["total_cotizacion"] == null ? null : json["total_cotizacion"],
        ticketId: json["ticketId"] == null ? null : json["ticketId"],
        tecnicoId: json["tecnicoId"] == null ? null : json["tecnicoId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "diagnostico_problema":
            diagnosticoProblema == null ? null : diagnosticoProblema,
        "solucion_tecnico": solucionTecnico == null ? null : solucionTecnico,
        "fecha_contacto": fechaContacto == null ? null : fechaContacto,
        "costo_mano_obra": costoManoObra == null ? null : costoManoObra,
        "costo_materiales": costoMateriales == null ? null : costoMateriales,
        "total_cotizacion": totalCotizacion == null ? null : totalCotizacion,
        "ticketId": ticketId == null ? null : ticketId,
        "tecnicoId": tecnicoId == null ? null : tecnicoId,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
