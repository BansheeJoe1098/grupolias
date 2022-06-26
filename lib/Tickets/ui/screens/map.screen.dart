import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/ui/screens/cotizaciones.screen.dart';
import 'package:grupolias/Tickets/services/map.service.dart';

import '../../controllers/ticket.controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.idTicket}) : super(key: key);

  final int idTicket;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
      body: Column(
        children: [
          FutureBuilder<void>(
            future: Mapita().abrirMapa(controller.ticket.value),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    decoration: const BoxDecoration(color: Colors.black),
                    child: const Text(
                      'Haz Llegado! Realiza tu cotizacion',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      child: const Text("Crear Cotizacion"),
                      onPressed: () {
                        Get.to(() => CotizacionesScreen(idTicket: idTicket));
                      },
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
