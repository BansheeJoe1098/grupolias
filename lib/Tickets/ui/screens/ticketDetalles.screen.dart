import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupoLias/Tickets/controller/ticket.controller.dart';
import 'package:grupoLias/Tickets/model/ticket.model.dart';
import 'package:grupoLias/Tickets/service/ticket.service.dart';
import 'package:grupoLias/Tickets/service/ticketDetalles.service.dart';
import 'package:grupoLias/NavBar/ui/pluguin/navbar.dart';
import 'package:universal_html/html.dart';
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
  final TicketController controller = Get.put(TicketController());
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
        actions: [
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 80,
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
                  controller.getCiudadByTicket(data!.ciudadId);
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
                          "${controller.ciudad.value.nombre}",
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
                  var ticketActualizado = controller.ticket.value;
                  ticketActualizado.estado = "TOMADO";

                  FutureBuilder<Ticket>(
                    future: TicketDetallesService().actualizarEstado(
                        idTicket, ticketActualizado.estado.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data!.estado.toString());
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    },
                  );
                  Get.to(() => MapScreen(idTicket: idTicket));
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Cotizar Ticket')),
            ],
          ),
        ),
      ),
    );
  }
}
