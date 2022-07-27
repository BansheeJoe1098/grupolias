import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Tickets/ui/screens/ticket-detalles.screen.dart';
import 'package:grupolias/TusTickets/services/tus-tickets.service.dart';

import '../../../Tickets/models/ticket.model.dart';

class TusTicketsScreen extends StatefulWidget {
  const TusTicketsScreen({Key? key}) : super(key: key);

  @override
  State<TusTicketsScreen> createState() => _TusTicketsScreenState();
}

class _TusTicketsScreenState extends State<TusTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tus Tickets'),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        actions: const [
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 50,
          ),
        ],
      ),
      body: FutureBuilder<List<Ticket>?>(
        future: TusTicketsService().ticketsOfTecnico(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Ticket>? ticketsList = snapshot.data;
            List<Widget> list = [];

            ticketsList?.forEach((ticket) {
              list.add(
                Card(
                  child: ListTile(
                    title: Text(ticket.numExpediente.toString()),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ticket.problematica.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: ticket.estado == "TOMADO"
                                ? Colors.deepPurple[200]
                                : ticket.estado == "COTIZADO"
                                    ? Colors.grey[200]
                                    : ticket.estado == "EN PROCESO"
                                        ? Colors.amber[200]
                                        : ticket.estado == "A CERRAR"
                                            ? Colors.blueAccent[200]
                                            : Colors.red[200],
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              ticket.estado.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.to(
                        () => TicketDetallesScreen(
                          titulo: ticket.numExpediente!,
                          idTicket: ticket.id!,
                        ),
                      );
                    },
                  ),
                ),
              );
            });

            return list.isEmpty
                ? const Center(
                    child: Text('No hay tickets'),
                  )
                : ListView(
                    children: list,
                  );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
