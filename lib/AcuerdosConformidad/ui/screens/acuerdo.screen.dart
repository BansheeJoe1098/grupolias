// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Signature_Form/ui/signature.dart';

class AcuerdoConformidad extends StatelessWidget {
  const AcuerdoConformidad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Llenado de \n acuerdo  de \n conformidad",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        backgroundColor: const Color.fromARGB(255, 40, 144, 214),
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        actions: const <Widget>[
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 150,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Expediente",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Fecha Acuerdo",
              ),
            ),
            TextFormField(
              minLines: 4,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: "Descripción del Problema",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Direccion",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Observaciones",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              minLines: 4,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: "Actividades realizadas",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Hora recepcion del Servicio",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Hora de Llegada de Servicio",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Acuerdo Firmado",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Usuario Final",
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(Signature());
              },
              child: const Text("Firmar"),
            )
          ],
        ),
      ),
    );
  }
}
