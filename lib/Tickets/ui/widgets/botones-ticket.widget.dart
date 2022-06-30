import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/ui/screens/foto-llegada.screen.dart';

import '../../../Cotizaciones/controllers/aprobacion-cotizacion.controller.dart';
import '../../../Cotizaciones/ui/screens/aprobacion-cotizacion.screen.dart';
import '../../controllers/ticket.controller.dart';
import '../../controllers/tickets.detalles.controller.dart';

class BotonesTicketWidget extends StatefulWidget {
  final int idTicket;
  final TicketsDetallesController ticketDetallesController;
  final TicketController ticketsController;
  final AprobacionCotizacionController controllerCotizacion;
  const BotonesTicketWidget({
    Key? key,
    required this.ticketDetallesController,
    required this.ticketsController,
    required this.idTicket,
    required this.controllerCotizacion,
  }) : super(key: key);

  @override
  State<BotonesTicketWidget> createState() => _BotonesTicketWidgetState();
}

class _BotonesTicketWidgetState extends State<BotonesTicketWidget> {
  late int idTicket;
  late TicketsDetallesController controllerTD;
  late TicketController ticketsController;
  late AprobacionCotizacionController controllerCotizacion;
  @override
  void initState() {
    super.initState();
    idTicket = widget.idTicket;
    controllerTD = widget.ticketDetallesController;
    ticketsController = widget.ticketsController;
    controllerCotizacion = widget.controllerCotizacion;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  child: const Text("Llegué"),
                  onPressed: () {
                    Get.to(
                      () => FotoLlegadaScreen(
                        idTicket: idTicket,
                      ),
                    );
                  },
                )
              : const SizedBox()),
        ),
        Obx(
          (() => controllerTD.ticket.value.estado == "COTIZADO"
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  child: const Text("Estado de aprobacion"),
                  onPressed: () async {
                    await controllerTD.getCotizacionByIdTicket(
                      idTicket,
                    );
                    Get.to(
                      () => AprobacionCotizacion(
                        cotizacion: controllerTD.cotizacion.value!,
                      ),
                    );
                  },
                )
              : const SizedBox()),
        ),
        Obx(
          (() => controllerTD.ticket.value.tecnicoId != null
              ? ElevatedButton(
                  onPressed: () => controllerCotizacion.lanzarMapa(
                    idTicket,
                  ),
                  child: const Text("Como llegar"),
                )
              : const SizedBox()),
        ),

        /* Si no se puede abrir el mapa, se despliega 
         * el botón con la URL del mapa origen y destino 
         */
        Obx(
          (() => controllerCotizacion.sePuedeAbrirMapa.value
              ? const Text("")
              : Column(
                  children: [
                    const SelectableText(
                        "No se pudo lanzar mapa copia la dirección y pegala en google maps"),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: controllerCotizacion.urlMapa.value,
                          ),
                        ).then((value) async {
                          await Clipboard.getData(Clipboard.kTextPlain);

                          Get.snackbar(
                            "Direccion copiada",
                            "Use la app de google maps para abrirla",
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 5),
                          );
                        });
                      },
                      icon: const Icon(Icons.copy),
                    )
                  ],
                )),
        )
      ],
    );
  }
}
