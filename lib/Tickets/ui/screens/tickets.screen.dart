import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Tickets/models/ticket.model.dart';
import 'package:grupolias/Tickets/services/ticket.service.dart';
import 'package:grupolias/Tickets/ui/widgets/CardListTickets.widget.dart';

import '../../controllers/ticket.controller.dart';

class TicketsScreen extends StatelessWidget {
  TicketsScreen({Key? key}) : super(key: key);

  final controller = Get.put(TicketController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        toolbarHeight: 75,
        actions: const [
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 65,
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
                        children: const [
                          Text(
                            'Bienvenido Jose',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
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
                      future: TicketService().getByEstado("NUEVO"),
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
                                height: 100,
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.all(8),
                                alignment: AlignmentDirectional.topStart,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.blueGrey,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // Shadow position
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
