import 'package:flutter/material.dart';

class CotizacionesScreen extends StatelessWidget {
  const CotizacionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onPressed;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              top: 30,
            ),
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: const Text(
              'Crear una cotizacion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 30,
                top: 30,
              ),
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 5,
                left: 4,
                right: 4,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
