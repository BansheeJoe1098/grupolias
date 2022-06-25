import 'package:get/get.dart';

import '../model/ticket.model.dart';
import '../service/ticketDetalles.service.dart';

class TicketsDetallesController extends GetxController {
  void tomarTicket(Ticket t) async {
    t.estado = "TOMADO";

    await TicketDetallesService().actualizarEstado(
      t.id,
      t.estado.toString(),
    );
  }
}
