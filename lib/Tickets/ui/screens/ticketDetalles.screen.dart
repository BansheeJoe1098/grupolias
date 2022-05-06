import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Tickets/model/ticket.model.dart';
import 'package:grupolias/Tickets/service/ticket.service.dart';

import 'map.screen.dart';

class Ticketdetalles extends StatelessWidget {
  const Ticketdetalles({Key? key, required this.titulo, required this.idTicket})
      : super(key: key);

  final String titulo;
  final int? idTicket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del ticket $titulo'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<Ticket>(
                future: TicketService().getTicketById(idTicket!),
                builder: (context, snapshot) {
                  Ticket? data = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Titulo Ticket",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "${data?.tituloTicket}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Problematica",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "${data?.problematica}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
              ElevatedButton(
                child: const Text("Tomar Ticket"),
                onPressed: () {
                  Get.to(MapScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
