import 'package:get/get.dart';

import '../model/ticket.model.dart';
import '../service/ticket.service.dart';

class TicketController extends GetxController {
  var ticket = Ticket().obs;

  void setTicket(Ticket t) {
    ticket.value = t;
  }

  void getTicket(int idTicket) async {
    ticket.value = await TicketService().getTicketById(idTicket);
    update();
  }
}
