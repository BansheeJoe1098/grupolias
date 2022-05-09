import 'package:flutter/material.dart';

class AcuerdoConformidad extends StatelessWidget {
  const AcuerdoConformidad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Llenado de acuerdo de conformidad"),
          backgroundColor: Colors.black),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Expediente",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Fecha Acuerdo",
              ),
            ),
            TextFormField(
              minLines:
                  4, // any number you need (It works as the rows for the textarea)
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: "Descripción del Problema",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Direccion",
              ),
            ),
            TextFormField(
              minLines:
                  4, // any number you need (It works as the rows for the textarea)
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: "Observaciones",
              ),
            ),
            TextFormField(
              minLines: 4,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: "Actividades realizadas",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Hora recepcion del Servicio",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Hora de Llegada de Servicio",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Acuerdo Firmado",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Usuario Final",
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Firmar"),
            )
          ],
        ),
      ),
    );
  }
}
