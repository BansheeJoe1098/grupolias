// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

class Ticket {
  Ticket({
    this.id,
    this.numExpediente,
    this.asistenciaVial,
    this.fechaLlamada,
    this.nombreAsesorAseguradora,
    this.nombreAsesorGpoLias,
    this.nombreUsuarioFinal,
    this.tituloTicket,
    this.asistenciaId,
    this.aseguradoraId,
    this.problematica,
    this.ciudad,
    this.colonia,
    this.calle,
    this.numeroDomicilio,
    this.banderazo,
    this.totalSalida,
    this.cobertura,
    this.cotizacionGpoLias,
    this.deducible,
    this.kilometraje,
    this.total,
    this.anticipo,
    this.horaCierre,
    this.casetas,
    this.costoGpoLias,
    this.estado,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? numExpediente;
  bool? asistenciaVial;
  DateTime? fechaLlamada;
  String? nombreAsesorAseguradora;
  String? nombreAsesorGpoLias;
  String? nombreUsuarioFinal;
  String? tituloTicket;
  int? asistenciaId;
  int? aseguradoraId;
  String? problematica;
  String? ciudad;
  String? colonia;
  String? calle;
  String? numeroDomicilio;
  String? banderazo;
  String? totalSalida;
  String? cobertura;
  String? cotizacionGpoLias;
  String? deducible;
  int? kilometraje;
  String? total;
  String? anticipo;
  dynamic horaCierre;
  int? casetas;
  String? costoGpoLias;
  String? estado;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Ticket.fromRawJson(String str) => Ticket.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"] == null ? null : json["id"],
        numExpediente:
            json["num_expediente"] == null ? null : json["num_expediente"],
        asistenciaVial:
            json["asistencia_vial"] == null ? null : json["asistencia_vial"],
        fechaLlamada: json["fecha_llamada"] == null
            ? null
            : DateTime.parse(json["fecha_llamada"]),
        nombreAsesorAseguradora: json["nombre_asesor_aseguradora"] == null
            ? null
            : json["nombre_asesor_aseguradora"],
        nombreAsesorGpoLias: json["nombre_asesor_gpo_lias"] == null
            ? null
            : json["nombre_asesor_gpo_lias"],
        nombreUsuarioFinal: json["nombre_usuario_final"] == null
            ? null
            : json["nombre_usuario_final"],
        tituloTicket:
            json["titulo_ticket"] == null ? null : json["titulo_ticket"],
        asistenciaId:
            json["asistenciaId"] == null ? null : json["asistenciaId"],
        aseguradoraId:
            json["aseguradoraId"] == null ? null : json["aseguradoraId"],
        problematica:
            json["problematica"] == null ? null : json["problematica"],
        ciudad: json["ciudad"] == null ? null : json["ciudad"],
        colonia: json["colonia"] == null ? null : json["colonia"],
        calle: json["calle"] == null ? null : json["calle"],
        numeroDomicilio:
            json["numero_domicilio"] == null ? null : json["numero_domicilio"],
        banderazo: json["banderazo"] == null ? null : json["banderazo"],
        totalSalida: json["total_salida"] == null ? null : json["total_salida"],
        cobertura: json["cobertura"] == null ? null : json["cobertura"],
        cotizacionGpoLias: json["cotizacion_gpo_lias"] == null
            ? null
            : json["cotizacion_gpo_lias"],
        deducible: json["deducible"] == null ? null : json["deducible"],
        kilometraje: json["kilometraje"] == null ? null : json["kilometraje"],
        total: json["total"] == null ? null : json["total"],
        anticipo: json["anticipo"] == null ? null : json["anticipo"],
        horaCierre: json["hora_cierre"],
        casetas: json["casetas"] == null ? null : json["casetas"],
        costoGpoLias:
            json["costo_gpo_lias"] == null ? null : json["costo_gpo_lias"],
        estado: json["estado"] == null ? null : json["estado"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "num_expediente": numExpediente == null ? null : numExpediente,
        "asistencia_vial": asistenciaVial == null ? null : asistenciaVial,
        "fecha_llamada":
            fechaLlamada == null ? null : fechaLlamada?.toIso8601String(),
        "nombre_asesor_aseguradora":
            nombreAsesorAseguradora == null ? null : nombreAsesorAseguradora,
        "nombre_asesor_gpo_lias":
            nombreAsesorGpoLias == null ? null : nombreAsesorGpoLias,
        "nombre_usuario_final":
            nombreUsuarioFinal == null ? null : nombreUsuarioFinal,
        "titulo_ticket": tituloTicket == null ? null : tituloTicket,
        "asistenciaId": asistenciaId == null ? null : asistenciaId,
        "aseguradoraId": aseguradoraId == null ? null : aseguradoraId,
        "problematica": problematica == null ? null : problematica,
        "ciudad": ciudad == null ? null : ciudad,
        "colonia": colonia == null ? null : colonia,
        "calle": calle == null ? null : calle,
        "numero_domicilio": numeroDomicilio == null ? null : numeroDomicilio,
        "banderazo": banderazo == null ? null : banderazo,
        "total_salida": totalSalida == null ? null : totalSalida,
        "cobertura": cobertura == null ? null : cobertura,
        "cotizacion_gpo_lias":
            cotizacionGpoLias == null ? null : cotizacionGpoLias,
        "deducible": deducible == null ? null : deducible,
        "kilometraje": kilometraje == null ? null : kilometraje,
        "total": total == null ? null : total,
        "anticipo": anticipo == null ? null : anticipo,
        "hora_cierre": horaCierre,
        "casetas": casetas == null ? null : casetas,
        "costo_gpo_lias": costoGpoLias == null ? null : costoGpoLias,
        "estado": estado == null ? null : estado,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
