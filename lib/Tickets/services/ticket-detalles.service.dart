import 'dart:convert';

import 'package:grupolias/constants.dart';
import 'package:http/http.dart' as http;
import '../models/ticket.model.dart';

class TicketDetallesService {
  String url = '${Constants.API_URL}/tickets';

  Future<Ticket?> tomarTicket(int id, String data) async {
    final response = await http.patch(
      Uri.parse('$url/tomar/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data,
    );

    if (response.statusCode == 409) {
      throw Exception(
        '''Fallo al tomar el ticket, 
          es posible que el ticket ya haya sido tomado''',
      );
    }
    if (response.statusCode == 200) {
      return Ticket.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
