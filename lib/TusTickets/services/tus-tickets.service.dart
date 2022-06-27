import 'dart:io';

import '../../Tickets/models/ticket.model.dart';
import '../../constants.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class TusTicketsService {
  String url = '${Constants.API_URL}/tickets';

  Future<List<Ticket>?> ticketsOfTecnico() async {
    //TODO: Sacar el Id desde la sesion del usuario
    final response = await http.get(
      Uri.parse("$url/tecnico/${1}"),
    );
    final jsonData = json.decode(response.body);
    final lista =
        List<Ticket>.from(jsonData.map((item) => Ticket.fromJson(item)));

    return lista;
  }
}
