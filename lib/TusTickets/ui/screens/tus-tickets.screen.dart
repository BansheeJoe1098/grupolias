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
            size: 80,
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
                    title: Text(ticket.id.toString()),
                    subtitle: Text(ticket.problematica.toString()),
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
