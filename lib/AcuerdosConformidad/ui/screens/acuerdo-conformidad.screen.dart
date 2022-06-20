import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/model/cotizacion.model.dart';

import '../../controller/acuerdo-conformidad.controller.dart';

class AcuerdoConformidadScreen extends StatefulWidget {
  final Cotizacion cotizacion;
  const AcuerdoConformidadScreen({
    Key? key,
    required this.cotizacion,
  }) : super(key: key);

  @override
  State<AcuerdoConformidadScreen> createState() =>
      _AcuerdoConformidadScreenState();
}

class _AcuerdoConformidadScreenState extends State<AcuerdoConformidadScreen> {
  final acuerdoFormKey = GlobalKey<FormState>();

  final controller = Get.put(AcuerdoConformidadController());
  late int idTicket;
  @override
  void initState() {
    super.initState();
    controller.cotizacion = widget.cotizacion;
    controller.getTicketAcuerdo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acuerdo de Conformidad'),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        actions: const [
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 80,
          ),
        ],
      ),
      floatingActionButton: Tooltip(
        message: "Enviar Acuerdo",
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            controller.submit(context);
          },
          child: const Icon(Icons.send),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: controller.acuerdoFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Descripcion del Problema 👀 ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        " ${controller.cotizacion.diagnosticoProblema}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Actividades Realizadas 📃",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        " ${controller.cotizacion.solucionTecnico}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Fecha y Hora ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        " ${DateTime.now()}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Observaciones ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingrese una observacion';
                          }
                          return null;
                        },
                        maxLines: 5,
                        textAlignVertical: TextAlignVertical.top,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: controller.observaciones,
                        decoration: const InputDecoration(
                          labelText: 'Diagnostico del problema ',
                          hintText:
                              'Ej: Se encontró cocodrilo en la alberca del domicilio',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
