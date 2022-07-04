import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/models/cotizacion.model.dart';

import '../../controllers/acuerdo-conformidad.controller.dart';
import '../widgets/alta-usuario-final-form.widget.dart';

class UsuarioFinalScreen extends StatefulWidget {
  final Cotizacion cotizacion;
  const UsuarioFinalScreen({
    Key? key,
    required this.cotizacion,
  }) : super(key: key);

  @override
  State<UsuarioFinalScreen> createState() => _UsuarioFinalScreenState();
}

class _UsuarioFinalScreenState extends State<UsuarioFinalScreen> {
  late var controller = Get.put(AcuerdoConformidadController());

  @override
  void initState() {
    super.initState();
    controller.cotizacion = widget.cotizacion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Acuerdo de conformidad',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        actions: const <Widget>[
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 60,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
          controller.enviarUsuarioFinal();
        },
        icon: const Icon(Icons.navigate_next_sharp),
        label: const Text(
          'Siguiente',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Datos del Usuario Final',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AltaUsuariosFinalesForm(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
