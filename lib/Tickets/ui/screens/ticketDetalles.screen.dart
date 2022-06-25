import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Tickets/controller/ticket.controller.dart';
import 'package:grupolias/Tickets/model/ticket.model.dart';
import 'package:grupolias/Tickets/service/ticket.service.dart';
import 'package:grupolias/Tickets/service/ticketDetalles.service.dart';
import '../../controller/tickets.detalles.controller.dart';
import 'map.screen.dart';

class Ticketdetalles extends StatefulWidget {
  const Ticketdetalles({Key? key, required this.titulo, required this.idTicket})
      : super(key: key);

  final String titulo;
  final int idTicket;

  @override
  State<Ticketdetalles> createState() => _TicketdetallesState();
}

class _TicketdetallesState extends State<Ticketdetalles> {
  final TicketController ticketsController = Get.put(TicketController());

  final TicketsDetallesController controllerTD =
      Get.put(TicketsDetallesController());

  late int idTicket;

  @override
  void initState() {
    super.initState();
    idTicket = widget.idTicket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle del ${widget.titulo}',
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 50,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<Ticket>(
                future: TicketService().getTicketById(idTicket),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LinearProgressIndicator(),
                    );
                  }

                  Ticket? data = snapshot.data;
                  ticketsController.getCiudadByTicket(data!.ciudadId);
                  ticketsController.ticket.value = data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ocupacion",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "${data.tituloTicket}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
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
                        "${data.problematica}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Fecha y Día 🕰",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("${data.fechaLlamada}",
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                      const SizedBox(height: 20),
                      const Text(
                        "Expediente 📃",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("${data.numExpediente}",
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                      const SizedBox(height: 10),
                      const Text(
                        "Ciudad 🌁",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Obx(
                        () => Text(
                          "${ticketsController.ciudad.value.nombre}",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Colonia 🏡",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("${data.colonia}",
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                      const SizedBox(height: 20),
                      const Text(
                        "Calle 🚗",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("${data.calle}",
                          style: const TextStyle(
                            fontSize: 15,
                          )),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: const Text("Tomar Ticket"),
                onPressed: () {
                  controllerTD.tomarTicket(ticketsController.ticket.value);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
