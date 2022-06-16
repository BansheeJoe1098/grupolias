// To parse this JSON data, do
//
//     final acuerdoConformidad = acuerdoConformidadFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

class AcuerdoConformidad {
  AcuerdoConformidad({
    this.id,
    this.fechaAcuerdo,
    this.descripcionProblema,
    this.direccion,
    this.observaciones,
    this.actividadesRealizadas,
    this.horaRecepcionServicio,
    this.horaLlegadaServicio,
    this.horaFinalizacionServicio,
    this.acuerdoFirmado,
    this.isAprobado,
    this.ticketId,
    this.usuarioFinalId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? fechaAcuerdo;
  String? descripcionProblema;
  String? direccion;
  String? observaciones;
  String? actividadesRealizadas;
  DateTime? horaRecepcionServicio;
  DateTime? horaLlegadaServicio;
  DateTime? horaFinalizacionServicio;
  String? acuerdoFirmado;
  bool? isAprobado;
  int? ticketId;
  int? usuarioFinalId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory AcuerdoConformidad.fromRawJson(String str) =>
      AcuerdoConformidad.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AcuerdoConformidad.fromJson(Map<String, dynamic> json) =>
      AcuerdoConformidad(
        id: json["id"] == null ? null : json["id"],
        fechaAcuerdo: json["fecha_acuerdo"] == null
            ? null
            : DateTime.parse(json["fecha_acuerdo"]),
        descripcionProblema: json["descripcion_problema"] == null
            ? null
            : json["descripcion_problema"],
        direccion: json["direccion"] == null ? null : json["direccion"],
        observaciones:
            json["observaciones"] == null ? null : json["observaciones"],
        actividadesRealizadas: json["actividades_realizadas"] == null
            ? null
            : json["actividades_realizadas"],
        horaRecepcionServicio: json["hora_recepcion_servicio"] == null
            ? null
            : DateTime.parse(json["hora_recepcion_servicio"]),
        horaLlegadaServicio: json["hora_llegada_servicio"] == null
            ? null
            : DateTime.parse(json["hora_llegada_servicio"]),
        horaFinalizacionServicio: json["hora_finalizacion_servicio"] == null
            ? null
            : DateTime.parse(json["hora_finalizacion_servicio"]),
        acuerdoFirmado:
            json["acuerdo_firmado"] == null ? null : json["acuerdo_firmado"],
        isAprobado: json["is_aprobado"] == null ? null : json["is_aprobado"],
        ticketId: json["ticketId"] == null ? null : json["ticketId"],
        usuarioFinalId:
            json["usuarioFinalId"] == null ? null : json["usuarioFinalId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "fecha_acuerdo":
            fechaAcuerdo == null ? null : fechaAcuerdo?.toIso8601String(),
        "descripcion_problema":
            descripcionProblema == null ? null : descripcionProblema,
        "direccion": direccion == null ? null : direccion,
        "observaciones": observaciones == null ? null : observaciones,
        "actividades_realizadas":
            actividadesRealizadas == null ? null : actividadesRealizadas,
        "hora_recepcion_servicio": horaRecepcionServicio == null
            ? null
            : horaRecepcionServicio?.toIso8601String(),
        "hora_llegada_servicio": horaLlegadaServicio == null
            ? null
            : horaLlegadaServicio?.toIso8601String(),
        "hora_finalizacion_servicio": horaFinalizacionServicio == null
            ? null
            : horaFinalizacionServicio?.toIso8601String(),
        "acuerdo_firmado": acuerdoFirmado == null ? null : acuerdoFirmado,
        "is_aprobado": isAprobado == null ? null : isAprobado,
        "ticketId": ticketId == null ? null : ticketId,
        "usuarioFinalId": usuarioFinalId == null ? null : usuarioFinalId,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
