import 'dart:convert';

Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));

String ticketToJson(Ticket data) => json.encode(data.toJson());

class Ticket {
  Ticket({
    required this.id,
    required this.numExpediente,
    required this.asistenciaVial,
    required this.fechaLlamada,
    required this.nombreAsesorAseguradora,
    required this.nombreAsesorGpoLias,
    required this.nombreUsuarioFinal,
    required this.tituloTicket,
    required this.asistenciaId,
    required this.aseguradoraId,
    required this.problematica,
    required this.ciudad,
    required this.colonia,
    required this.calle,
    required this.numeroDomicilio,
    required this.banderazo,
    required this.totalSalida,
    required this.cobertura,
    required this.cotizacionGpoLias,
    required this.deducible,
    required this.kilometraje,
    required this.total,
    required this.anticipo,
    required this.horaCierre,
    required this.casetas,
    required this.costoGpoLias,
    required this.estado,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String numExpediente;
  bool asistenciaVial;
  DateTime fechaLlamada;
  String nombreAsesorAseguradora;
  String nombreAsesorGpoLias;
  String nombreUsuarioFinal;
  String tituloTicket;
  int asistenciaId;
  int aseguradoraId;
  String problematica;
  String ciudad;
  String colonia;
  String calle;
  String numeroDomicilio;
  int banderazo;
  int totalSalida;
  int cobertura;
  String cotizacionGpoLias;
  int deducible;
  int kilometraje;
  int total;
  int anticipo;
  DateTime horaCierre;
  int casetas;
  int costoGpoLias;
  String estado;
  DateTime createdAt;
  DateTime updatedAt;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        numExpediente: json["num_expediente"],
        asistenciaVial: json["asistencia_vial"],
        fechaLlamada: DateTime.parse(json["fecha_llamada"]),
        nombreAsesorAseguradora: json["nombre_asesor_aseguradora"],
        nombreAsesorGpoLias: json["nombre_asesor_gpo_lias"],
        nombreUsuarioFinal: json["nombre_usuario_final"],
        tituloTicket: json["titulo_ticket"],
        asistenciaId: json["asistenciaId"],
        aseguradoraId: json["aseguradoraId"],
        problematica: json["problematica"],
        ciudad: json["ciudad"],
        colonia: json["colonia"],
        calle: json["calle"],
        numeroDomicilio: json["numero_domicilio"],
        banderazo: json["banderazo"],
        totalSalida: json["total_salida"],
        cobertura: json["cobertura"],
        cotizacionGpoLias: json["cotizacion_gpo_lias"],
        deducible: json["deducible"],
        kilometraje: json["kilometraje"],
        total: json["total"],
        anticipo: json["anticipo"],
        horaCierre: DateTime.parse(json["hora_cierre"]),
        casetas: json["casetas"],
        costoGpoLias: json["costo_gpo_lias"],
        estado: json["estado"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num_expediente": numExpediente,
        "asistencia_vial": asistenciaVial,
        "fecha_llamada": fechaLlamada.toIso8601String(),
        "nombre_asesor_aseguradora": nombreAsesorAseguradora,
        "nombre_asesor_gpo_lias": nombreAsesorGpoLias,
        "nombre_usuario_final": nombreUsuarioFinal,
        "titulo_ticket": tituloTicket,
        "asistenciaId": asistenciaId,
        "aseguradoraId": aseguradoraId,
        "problematica": problematica,
        "ciudad": ciudad,
        "colonia": colonia,
        "calle": calle,
        "numero_domicilio": numeroDomicilio,
        "banderazo": banderazo,
        "total_salida": totalSalida,
        "cobertura": cobertura,
        "cotizacion_gpo_lias": cotizacionGpoLias,
        "deducible": deducible,
        "kilometraje": kilometraje,
        "total": total,
        "anticipo": anticipo,
        "hora_cierre": horaCierre.toIso8601String(),
        "casetas": casetas,
        "costo_gpo_lias": costoGpoLias,
        "estado": estado,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
