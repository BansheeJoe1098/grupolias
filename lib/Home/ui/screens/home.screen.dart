// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:grupolias/Perfil/ui/screens/perfil.screen.dart';
import 'package:grupolias/Cotizaciones/ui/screens/tus-tickets.screen.dart';
import 'package:grupolias/Tickets/ui/screens/tickets.screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _screenSeleccionada = 0;

  static final List<Widget> _screens = <Widget>[
    TicketsScreen(),
    const TusTicketsScreen(),
    const PerfilScreen(),
  ];

  void _setScreen(int index) {
    setState(() {
      _screenSeleccionada = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_screenSeleccionada),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8),
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Tickets Disponibles',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num_sharp),
              label: 'Tus tickets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: _screenSeleccionada,
          onTap: _setScreen,
        ),
      ),
    );
  }
}
