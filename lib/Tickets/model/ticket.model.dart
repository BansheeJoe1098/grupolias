// To parse this JSON data, do
//
//     final ticket = ticketFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

class Ticket {
  Ticket({
    this.id,
    this.numExpediente,
    this.asistenciaVial,
    this.fechaLlamada,
    this.nombreAsesorGpoLias,
    this.asesorId,
    this.nombreUsuarioFinal,
    this.tituloTicket,
    this.asistenciaId,
    this.aseguradoraId,
    this.problematica,
    this.ciudadId,
    this.colonia,
    this.calle,
    this.numeroDomicilio,
    this.banderazo,
    this.totalSalida,
    this.cobertura,
    this.cotizacionGpoLias,
    this.deducible,
    this.kilometraje,
    this.costoDeKilometraje,
    this.costoPorCaseta,
    this.total,
    this.anticipo,
    this.horaCierre,
    this.casetas,
    this.costoGpoLias,
    this.estado,
    this.numInterior,
    this.modeloCarro,
    this.placasCarro,
    this.colorCarro,
    this.marcaCarro,
    this.isServicioDomestico,
    this.isServicioForaneo,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? numExpediente;
  bool? asistenciaVial;
  DateTime? fechaLlamada;
  String? nombreAsesorGpoLias;
  int? asesorId;
  String? nombreUsuarioFinal;
  String? tituloTicket;
  int? asistenciaId;
  int? aseguradoraId;
  String? problematica;
  int? ciudadId;
  String? colonia;
  String? calle;
  String? numeroDomicilio;
  int? banderazo;
  int? totalSalida;
  int? cobertura;
  String? cotizacionGpoLias;
  int? deducible;
  int? kilometraje;
  int? costoDeKilometraje;
  int? costoPorCaseta;
  int? total;
  int? anticipo;
  DateTime? horaCierre;
  int? casetas;
  int? costoGpoLias;
  String? estado;
  String? numInterior;
  String? modeloCarro;
  String? placasCarro;
  String? colorCarro;
  String? marcaCarro;
  bool? isServicioDomestico;
  bool? isServicioForaneo;
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
        nombreAsesorGpoLias: json["nombre_asesor_gpo_lias"] == null
            ? null
            : json["nombre_asesor_gpo_lias"],
        asesorId: json["asesorId"] == null ? null : json["asesorId"],
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
        ciudadId: json["ciudadId"] == null ? null : json["ciudadId"],
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
        costoDeKilometraje: json["costo_de_kilometraje"] == null
            ? null
            : json["costo_de_kilometraje"],
        costoPorCaseta:
            json["costo_por_caseta"] == null ? null : json["costo_por_caseta"],
        total: json["total"] == null ? null : json["total"],
        anticipo: json["anticipo"] == null ? null : json["anticipo"],
        horaCierre: json["hora_cierre"],
        casetas: json["casetas"] == null ? null : json["casetas"],
        costoGpoLias:
            json["costo_gpo_lias"] == null ? null : json["costo_gpo_lias"],
        estado: json["estado"] == null ? null : json["estado"],
        numInterior: json["num_interior"] == null ? null : json["num_interior"],
        modeloCarro: json["modelo_carro"] == null ? null : json["modelo_carro"],
        placasCarro: json["placas_carro"] == null ? null : json["placas_carro"],
        colorCarro: json["color_carro"] == null ? null : json["color_carro"],
        marcaCarro: json["marca_carro"] == null ? null : json["marca_carro"],
        isServicioDomestico: json["is_servicio_domestico"] == null
            ? null
            : json["is_servicio_domestico"],
        isServicioForaneo: json["is_servicio_foraneo"] == null
            ? null
            : json["is_servicio_foraneo"],
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
        "nombre_asesor_gpo_lias":
            nombreAsesorGpoLias == null ? null : nombreAsesorGpoLias,
        "asesorId": asesorId == null ? null : asesorId,
        "nombre_usuario_final":
            nombreUsuarioFinal == null ? null : nombreUsuarioFinal,
        "titulo_ticket": tituloTicket == null ? null : tituloTicket,
        "asistenciaId": asistenciaId == null ? null : asistenciaId,
        "aseguradoraId": aseguradoraId == null ? null : aseguradoraId,
        "problematica": problematica == null ? null : problematica,
        "ciudadId": ciudadId == null ? null : ciudadId,
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
        "costo_de_kilometraje":
            costoDeKilometraje == null ? null : costoDeKilometraje,
        "costo_por_caseta": costoPorCaseta == null ? null : costoPorCaseta,
        "total": total == null ? null : total,
        "anticipo": anticipo == null ? null : anticipo,
        "hora_cierre":
            horaCierre == null ? null : horaCierre?.toIso8601String(),
        "casetas": casetas == null ? null : casetas,
        "costo_gpo_lias": costoGpoLias == null ? null : costoGpoLias,
        "estado": estado == null ? null : estado,
        "num_interior": numInterior == null ? null : numInterior,
        "modelo_carro": modeloCarro == null ? null : modeloCarro,
        "placas_carro": placasCarro == null ? null : placasCarro,
        "color_carro": colorCarro == null ? null : colorCarro,
        "marca_carro": marcaCarro == null ? null : marcaCarro,
        "is_servicio_domestico":
            isServicioDomestico == null ? null : isServicioDomestico,
        "is_servicio_foraneo":
            isServicioForaneo == null ? null : isServicioForaneo,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
