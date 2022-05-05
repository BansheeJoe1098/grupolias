import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/ticketDetalles.screen.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({Key? key, this.ticketId, required this.tituloTicket})
      : super(key: key);

  final int? ticketId;
  final String tituloTicket;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              tituloTicket,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Get.to(Ticketdetalles(
                titulo: "$ticketId",
                idTicket: ticketId,
              ));
            },
            child: const Text('Ver'),
          ),
        )
      ],
    );
  }
}
