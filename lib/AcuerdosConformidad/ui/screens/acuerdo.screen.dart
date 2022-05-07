import 'package:flutter/material.dart';

class AcuerdoConformidad extends StatelessWidget {
  const AcuerdoConformidad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Llenado de acuerdo de conformidad"),
          backgroundColor: Colors.black),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Expediente",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Fecha Acuerdo",
              ),
            ),
            TextFormField(
              minLines:
                  4, // any number you need (It works as the rows for the textarea)
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Descripción del Problema",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Direccion",
              ),
            ),
            TextFormField(
              minLines:
                  4, // any number you need (It works as the rows for the textarea)
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Observaciones",
              ),
            ),
            TextFormField(
              minLines: 4,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Actividades realizadas",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Hora recepcion del Servicio",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Hora de Llegada de Servicio",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Acuerdo Firmado",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Usuario Final",
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Firmar"),
            )
          ],
        ),
      ),
    );
  }
}
