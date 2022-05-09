import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Tickets/controller/ticket.controller.dart';

import '../../model/ticket.model.dart';
import '../screens/ticketDetalles.screen.dart';

class CardListWidget extends StatelessWidget {
  CardListWidget({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  final Ticket ticket;

  final controller = Get.put(TicketController());
  @override
  Widget build(BuildContext context) {
    controller.setTicket(ticket);
    return Row(
      children: [
        Column(
          children: [
            Obx(
              (() => Text(
                    "${controller.ticket.value.tituloTicket}",
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            )
          ],
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              controller.setTicket(ticket);
              Get.to(Ticketdetalles(
                titulo: "Ticket ${ticket.numExpediente}",
                idTicket: ticket.id,
              ));
            },
            child: const Text('Ver'),
          ),
        )
      ],
    );
  }
}
