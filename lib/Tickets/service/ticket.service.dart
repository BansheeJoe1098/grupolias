import 'package:http/http.dart' as http;

import '../model/ticket.model.dart';

Uri url = Uri.parse('http://192.168.0.62/tickets/1');

Future<List<Ticket>> geTickets() async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return ticketFromJson(response.body) as List<Ticket>;
  } else {
    throw Exception('Failed to load tickets');
  }
}

Future<Ticket> getTicket(int id) async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return ticketFromJson(response.body);
  } else {
    throw Exception('Failed to load ticket');
  }
}
