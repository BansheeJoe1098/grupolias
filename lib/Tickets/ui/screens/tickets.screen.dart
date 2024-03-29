import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Global/controllers/global.controller.dart';
import 'package:grupolias/Tickets/models/ticket.model.dart';
import 'package:grupolias/Tickets/services/ticket.service.dart';
import 'package:grupolias/Tickets/ui/widgets/ticket-list-item.widget.dart';

import '../../controllers/ticket.controller.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  final controller = Get.put(TicketController());
  final globalController = Get.put(GlobalController());
  @override
  void initState() {
    super.initState();
    globalController.getUsuarioLogueado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: const [
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 50,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 32, left: 10),
                      margin: const EdgeInsetsDirectional.only(bottom: 50),
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              'Bienvenid@ ${globalController.tecnicoLogueado.value?.nombre}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const Text(
                            'Estos son los tickets que tenemos para ti',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<List<Ticket>>(
                      future: TicketService().ticketsByCiudadOfUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          //Tickets que vienen de la API
                          List<Ticket>? listaTickets = snapshot.data;

                          //Tickets como tarjetas
                          List<Widget> list = [];

                          listaTickets?.forEach((ticket) {
                            list.add(
                              Container(
                                height: 120,
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.all(8),
                                alignment: AlignmentDirectional.topStart,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      offset: Offset(0, 5), // Shadow position
                                    ),
                                  ],
                                ),
                                child: TicketListItem(
                                  ticket: ticket,
                                ),
                              ),
                            );
                          });

                          return Column(
                            children: list,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
