import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/ui/screens/cotizaciones.screen.dart';
import 'package:grupolias/Tickets/service/map.service.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<void>(
            future: Mapita().abrirMapa(19.7066752, -101.1843072),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: const Text(
                      'Haz Llegado! Realiza tu cotizacion',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    decoration: const BoxDecoration(color: Colors.black),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text("Crear Cotizacion"),
                      onPressed: () {
                        Get.to(const CotizacionesScreen());
                      },
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
