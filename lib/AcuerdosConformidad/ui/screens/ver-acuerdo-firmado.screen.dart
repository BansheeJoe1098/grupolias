import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/AcuerdosConformidad/controllers/ver-acuerdo-conformidad.controller.dart';
import 'package:grupolias/Home/ui/screens/home.screen.dart';

import '../../models/acuerdo-conformidad.model.dart';

class VerAcuerdoFirmadoScreen extends StatefulWidget {
  final AcuerdoConformidad acuerdoConformidad;

  const VerAcuerdoFirmadoScreen({Key? key, required this.acuerdoConformidad})
      : super(key: key);

  @override
  State<VerAcuerdoFirmadoScreen> createState() =>
      _VerAcuerdoFirmadoScreenState();
}

class _VerAcuerdoFirmadoScreenState extends State<VerAcuerdoFirmadoScreen> {
  var controller = Get.put(VerAcuerdoConformidadController());
  late AcuerdoConformidad acuerdoConformidad;

  @override
  initState() {
    super.initState();
    acuerdoConformidad = widget.acuerdoConformidad;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        tooltip: "Regresar pantalla principal",
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Get.offAll(
            () => const Home(),
          );
        },
      ),
      body: FutureBuilder(
          future: controller.loadDocument(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text("Hola");
              // return PDFViewer(
              //   document: document,
              // );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
