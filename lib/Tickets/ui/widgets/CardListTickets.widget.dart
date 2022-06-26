import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/ticket.controller.dart';
import '../../models/ticket.model.dart';
import '../screens/ticket-detalles.screen.dart';

class TicketListItem extends StatefulWidget {
  const TicketListItem({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  final Ticket ticket;

  @override
  State<TicketListItem> createState() => _TicketListItemState();
}

class _TicketListItemState extends State<TicketListItem> {
  final controller = Get.put(TicketController());
  late int? idTicket;
  @override
  void initState() {
    super.initState();
    controller.ticket.value = widget.ticket;
    idTicket = widget.ticket.id;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "${controller.ticket.value.tituloTicket}",
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        Expanded(
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Get.to(
                () => TicketdetallesScreen(
                  titulo: "Ticket ${widget.ticket.numExpediente}",
                  idTicket: widget.ticket.id!,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
