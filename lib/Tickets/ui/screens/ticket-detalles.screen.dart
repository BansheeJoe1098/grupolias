import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/ui/screens/cotizaciones.screen.dart';
import 'package:grupolias/Tickets/controllers/ticket.controller.dart';
import 'package:grupolias/Tickets/models/ticket.model.dart';
import 'package:grupolias/Tickets/services/ticket.service.dart';
import '../../controllers/tickets.detalles.controller.dart';

class TicketDetallesScreen extends StatefulWidget {
  const TicketDetallesScreen(
      {Key? key, required this.titulo, required this.idTicket})
      : super(key: key);

  final String titulo;
  final int idTicket;

  @override
  State<TicketDetallesScreen> createState() => _TicketDetallesScreenState();
}

class _TicketDetallesScreenState extends State<TicketDetallesScreen> {
  final TicketController ticketsController = Get.put(TicketController());

  final TicketsDetallesController controllerTD =
      Get.put(TicketsDetallesController());

  late int idTicket;

  @override
  void initState() {
    super.initState();
    idTicket = widget.idTicket;
    controllerTD.getTicket(idTicket);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expediente ${widget.titulo}',
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
              FutureBuilder<Ticket?>(
                future: TicketService().getTicketById(idTicket),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LinearProgressIndicator(),
                    );
                  }

                  Ticket? data = snapshot.data;
                  ticketsController.getCiudadById(data!.ciudadId);
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
                      ),
                    ],
                  );
                },
              ),
              Obx(
                (() => controllerTD.ticket.value.estado == "NUEVO"
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        child: const Text("Tomar Ticket"),
                        onPressed: () {
                          controllerTD.tomarTicket(
                            ticketsController.ticket.value,
                          );
                        },
                      )
                    : const SizedBox()),
              ),
              Obx(
                (() => controllerTD.ticket.value.estado == "TOMADO"
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: const Text("Cotizar Ticket"),
                        onPressed: () {
                          Get.to(
                            () => CotizacionesScreen(
                              idTicket: idTicket,
                            ),
                          );
                        },
                      )
                    : const SizedBox()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
