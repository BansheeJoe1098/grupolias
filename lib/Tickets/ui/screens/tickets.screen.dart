import 'package:flutter/material.dart';
import 'package:grupolias/Tickets/model/ticket.model.dart';
import 'package:grupolias/Tickets/service/ticket.service.dart';
import 'package:grupolias/Tickets/ui/widgets/CardListTickets.widget.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                          'Bienvenido Luis',
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
                    future: TicketService().getAll(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<Ticket>? listaTickets = snapshot.data;

                        List<Widget> list = [];

                        listaTickets?.forEach((element) {
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
                              child: CardListWidget(
                                tituloTicket: element.tituloTicket,
                                ticketId: element.id,
                              ),
                            ),
                          );
                        });

                        return Column(children: list);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
