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

  Future<Ticket> getTicketById(int id) async {
    final response = await http.get(Uri.parse('$url/$id'));

    return Ticket.fromRawJson(response.body);
  }
}
