import 'package:flutter/material.dart';
import 'package:grupolias/Tickets/service/map.service.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('MapScreen'),
          FutureBuilder<void>(
            future: Mapita().abrirMapa(19.7066752, -101.1843072),
            builder: (context, snapshot) {
              return Text('Mapa abierto');
            },
          )
        ],
      ),
    );
  }
}
