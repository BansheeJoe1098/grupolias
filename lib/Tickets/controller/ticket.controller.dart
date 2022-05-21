import 'package:get/get.dart';

import '../model/ticket.model.dart';

class TicketController extends GetxController {
  var ticket = Ticket().obs;

  void setTicket(Ticket t) {
    ticket.value = t;
    update();
  }
}
