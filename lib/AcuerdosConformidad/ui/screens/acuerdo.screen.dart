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
        backgroundColor: Color.fromARGB(255, 40, 144, 214),
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        actions: <Widget>[
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
            SizedBox(
              height: 50,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Expediente",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            const TextField(
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
            SizedBox(
              height: 50,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Direccion",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Observaciones",
              ),
            ),
            SizedBox(
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
            SizedBox(
              height: 50,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Hora recepcion del Servicio",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Hora de Llegada de Servicio",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Acuerdo Firmado",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Usuario Final",
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(signatureform());
              },
              child: const Text("Firmar"),
            )
          ],
        ),
      ),
    );
  }
}
