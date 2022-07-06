import 'dart:convert';

import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grupolias/Global/widgets/custom.snackbar.dart';
import 'package:grupolias/constants.dart';
import 'package:http/http.dart' as http;

import '../../Cotizaciones/models/cotizacion.model.dart';
import '../models/ticket.model.dart';

class TicketService {
  String urlTickets = '${Constants.API_URL}/tickets';
  String urlCotizaciones = '${Constants.API_URL}/cotizaciones-tecnico';

  Future<List<Ticket>> getAll() async {
    final response = await http.get(Uri.parse(urlTickets));
    final jsonData = json.decode(response.body);
    final lista =
        List<Ticket>.from(jsonData.map((item) => Ticket.fromJson(item)));
    return lista;
  }

  Future<List<Ticket>> ticketsByCiudadOfUser() async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');

    final response = await http.get(Uri.parse("$urlTickets/ciudad"),
        headers: token != null ? {'Authorization': 'Bearer $token'} : null);

    final jsonData = json.decode(response.body);
    final lista =
        List<Ticket>.from(jsonData.map((item) => Ticket.fromJson(item)));
    return lista;
  }

  Future<Ticket> getTicketById(int id) async {
    final response = await http.get(Uri.parse('$urlTickets/$id'));

    if (response.statusCode == 200) {
      return Ticket.fromRawJson(response.body);
    } else {
      CustomSnackBar(
        titulo: "Error al obtener el ticket",
        descripcion: "No se pudo obtener el ticket",
        color: Colors.red,
      );

      throw const HttpExceptionWithStatus(404, "Error al obtener el ticket");
    }
  }

  Future<Ticket> setCotizado(int idTicket) async {
    final response = await http.patch(Uri.parse('$urlTickets/$idTicket'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'estado': 'COTIZADO'}));

    return Ticket.fromRawJson(response.body);
  }

  Future<Ticket> setACerrar(int idTicket) async {
    final response = await http.patch(Uri.parse('$urlTickets/$idTicket'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'estado': 'A CERRAR'}));

    return Ticket.fromRawJson(response.body);
  }

  Future<bool> abortarTicket(Ticket ticket, Cotizacion? cotizacion) async {
    var payload = {
      'estado': 'NUEVO',
      'tecnicoId': null,
    };
    final responseTicket = await http.patch(
      Uri.parse('$urlTickets/${ticket.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );

    await http.delete(
      Uri.parse('$urlCotizaciones/${cotizacion?.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(payload),
    );

    if (responseTicket.statusCode == 200) {
      CustomSnackBar(
        titulo: "Ticket abortado",
        descripcion: "El ticket ha sido abortado",
        color: Colors.green,
      );

      return true;
    } else {
      CustomSnackBar(
        titulo: "Error al abortar el ticket",
        descripcion: "No se pudo abortar el ticket",
        color: Colors.red,
      );
      return false;
    }

    //return Ticket.fromRawJson(response.body);
  }
}
