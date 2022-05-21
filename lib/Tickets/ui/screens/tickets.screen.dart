import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Tickets/model/ticket.model.dart';
import 'package:grupolias/Tickets/service/ticket.service.dart';
import 'package:grupolias/Tickets/ui/widgets/CardListTickets.widget.dart';

import '../../controller/ticket.controller.dart';

class TicketsScreen extends StatelessWidget {
  TicketsScreen({Key? key}) : super(key: key);

  final controller = Get.put(TicketController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'GRUPO LIAS',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 25.0,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 40, 144, 214),
        toolbarHeight: 50,
        actions: [
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 100,
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 40, 144, 214),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 52, left: 50),
                    margin: const EdgeInsetsDirectional.only(bottom: 50),
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
                    future: TicketService().getAll(),
                    builder: (context, snapshot) {
                      print(snapshot.connectionState);
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
                                ticket: element,
                              ),
                            ),
                          );
                        });

                        return Column(children: list);
                      } else {
                        return const AlertDialog(
                          title: Text("Verifique su conexion a internet"),
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
    );
  }
}
