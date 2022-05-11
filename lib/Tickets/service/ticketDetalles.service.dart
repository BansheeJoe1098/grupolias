import 'dart:convert';

import 'package:grupolias/constants.dart';
import 'package:http/http.dart' as http;
import '../model/ticket.model.dart';

class TicketDetallesService {
  String url = '${Constants.API_URL}/tickets';

  Future<Ticket> actualizarEstado(int? id, String estado) async {
    var data = '{"estado": "$estado"}';

    final response = await http.patch(
      Uri.parse('$url/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data,
    );

    if (response.statusCode == 200) {
      return Ticket.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fallo al realizar la actualización');
    }
  }
}
