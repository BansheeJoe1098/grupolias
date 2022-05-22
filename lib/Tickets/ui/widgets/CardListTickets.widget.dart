import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/ticket.model.dart';
import '../screens/ticketDetalles.screen.dart';

class CardListWidget extends StatefulWidget {
  const CardListWidget({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  final Ticket ticket;

  @override
  State<CardListWidget> createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  late Ticket _t;

  @override
  void initState() {
    super.initState();
    _t = widget.ticket;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              "${_t.tituloTicket}",
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
                () => Ticketdetalles(
                  titulo: "Ticket ${widget.ticket.numExpediente}",
                  idTicket: widget.ticket.id,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
