import 'package:get/get.dart';
import 'package:grupolias/Tickets/services/ciudad.service.dart';

import '../models/ciudad.model.dart';
import '../models/ticket.model.dart';
import '../services/ticket.service.dart';

class TicketController extends GetxController {
  var ticket = Ticket().obs;
  var ciudad = Ciudad().obs;

  void setTicket(Ticket t) {
    ticket.value = t;
  }

  void getTicket(int idTicket) async {
    ticket.value = await TicketService().getTicketById(idTicket);
    update();
  }

  void getCiudadById(int? idCiudad) async {
    ciudad.value = await CiudadService().getCiudadById(idCiudad);
    update();
  }
}
