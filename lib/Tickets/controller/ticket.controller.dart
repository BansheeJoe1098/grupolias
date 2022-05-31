import 'package:get/get.dart';
import 'package:grupoLias/Tickets/service/ciudad.service.dart';

import '../model/ciudad.model.dart';
import '../model/ticket.model.dart';
import '../service/ticket.service.dart';

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

  void getCiudadByTicket(int? idCiudad) async {
    ciudad.value = await CiudadService().getCiudadById(idCiudad);
    update();
  }
}
