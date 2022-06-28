import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/ticket.controller.dart';
import '../../models/ticket.model.dart';
import '../screens/ticket-detalles.screen.dart';

class TicketListItem extends StatefulWidget {
  final Ticket ticket;

  const TicketListItem({
    Key? key,
    required this.ticket,
  }) : super(key: key);

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
    controller.getCiudadById(controller.ticket.value.ciudadId);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${controller.ticket.value.tituloTicket}",
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            LimitedBox(
              maxWidth: 300,
              maxHeight: 100,
              child: Text(
                "${controller.ticket.value.problematica}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                const Icon(Icons.location_pin),
                Obx(
                  () => Text(
                    "${controller.ciudad.value.nombre}",
                    maxLines: 2,
                  ),
                ),
              ],
            )
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(172, 236, 236, 236),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.grey,
            ),
            onPressed: () {
              Get.to(
                () => TicketDetallesScreen(
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
