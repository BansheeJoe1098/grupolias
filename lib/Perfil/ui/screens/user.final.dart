import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/AcuerdosConformidad/controllers/acuerdo-conformidad.controller.dart';

class UserFinal extends StatefulWidget {
  UserFinal({Key? key}) : super(key: key);

  @override
  State<UserFinal> createState() => _UserFinalState();
}

class _UserFinalState extends State<UserFinal> {
  final controller = Get.put(AcuerdoConformidadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Usuario Final',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        actions: const <Widget>[
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 80,
          ),
        ],
      ),
      floatingActionButton: Tooltip(
        message: "Enviar Acuerdo para Firmar",
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            controller.submit(context);
            //Get.to(UserFinal());
          },
          child: const Icon(Icons.send),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 100.0, top: 65.0, right: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Datos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 45),
            const Text(
              'Nombre',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Aqui va el Obx
            const SizedBox(height: 30),
            const Text(
              'Apellido Paterno',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Apellido Materno',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Aqui va el Obx
            const SizedBox(height: 30),
            const Text(
              'Apellido Correo',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Aqui va el Obx
            const SizedBox(height: 30),
            const Text(
              'Telefono',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
