import 'dart:convert';

import 'package:grupolias/constants.dart';
import 'package:http/http.dart' as http;

import '../model/ticket.model.dart';

class TicketService {
  String url = '${Constants.API_URL}/tickets';

  Future<List<Ticket>> getAll() async {
    final response = await http.get(Uri.parse(url));
    final jsonData = json.decode(response.body);
    final lista =
        List<Ticket>.from(jsonData.map((item) => Ticket.fromJson(item)));
    return lista;
  }

  Future<List<Ticket>> getByEstado(String estado) async {
    final response = await http.get(Uri.parse("$url/estado/$estado"));
    final jsonData = json.decode(response.body);
    final lista =
        List<Ticket>.from(jsonData.map((item) => Ticket.fromJson(item)));
    return lista;
  }

  Future<Ticket> getTicketById(int id) async {
    final response = await http.get(Uri.parse('$url/$id'));

    return Ticket.fromRawJson(response.body);
  }

  Future<Ticket> setCotizado(int idTicket) async {
    final response = await http.patch(Uri.parse('$url/$idTicket'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'estado': 'COTIZADO'}));

    return Ticket.fromRawJson(response.body);
  }

  Future<Ticket> setACerrar(int idTicket) async {
    final response = await http.patch(Uri.parse('$url/$idTicket'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'estado': 'A CERRAR'}));

    return Ticket.fromRawJson(response.body);
  }
}
