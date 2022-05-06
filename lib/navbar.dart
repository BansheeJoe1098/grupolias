import 'package:flutter/material.dart';
import 'package:grupolias/Cotizaciones/ui/screens/cotizaciones.screen.dart';
import 'package:grupolias/Tickets/ui/screens/tickets.screen.dart';
import 'package:grupolias/Perfil/ui/screens/perfil.dart';

class BasicBottomNavBar extends StatefulWidget {
  const BasicBottomNavBar({Key? key}) : super(key: key);

  @override
  _BasicBottomNavBarState createState() => _BasicBottomNavBarState();
}

class _BasicBottomNavBarState extends State<BasicBottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Scaffold(
      body: TicketsScreen(),
    ),
    CotizacionesScreen(),
    perfil(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
              label: 'Trabajos Realizados',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Cotizacion',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_alarm_sharp),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
