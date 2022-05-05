import 'dart:convert';

import 'package:grupolias/constants.dart';
import 'package:http/http.dart' as http;

import '../model/ticket.model.dart';

class TicketService {
  String url = '${Constants.API_URL}/tickets';

  Future<List<Ticket>> getAll() async {
    final response = await http.get(Uri.parse(url));
    final jsonData = json.decode(response.body);
    return List<Ticket>.from(jsonData.map((item) => Ticket.fromJson(item)));
  }

  Future<Ticket> getTicketById(int id) async {
    final response = await http.get(Uri.parse('$url/$id'));

    return Ticket.fromRawJson(response.body);
  }
}
