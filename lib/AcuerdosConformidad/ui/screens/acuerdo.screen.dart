import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupoLias/AcuerdosConformidad/controller/aprobacion-acuerdo.controller.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';
import 'package:grupoLias/Cotizaciones/model/cotizacion.model.dart';
import 'package:grupoLias/AcuerdosConformidad/controller/acuerdo.controller.dart';
import 'package:grupoLias/Signature_Form/ui/signature.dart';
import '../../../Cotizaciones/controller/aprobacion-cotizacion.controller.dart';

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
  late Cotizacion? cotizacion;
  final acuerdoFormKey = GlobalKey<FormState>();
  final controller = Get.put(AprobacionCotizacionController());
  final controllerA = Get.put(AcuerdosController());
  late int idTicket;
  @override
  void initState() {
    super.initState();
    cotizacion = widget.cotizacion;
    controller.cotizacion.value = cotizacion!;
    controller.calculoTiempoTranscurrido();
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
          child: const Icon(Icons.send),
          backgroundColor: Colors.black,
          onPressed: () {
            Get.to(Signature());
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
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
                    " ${cotizacion?.diagnosticoProblema}",
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
                    " ${cotizacion?.solucionTecnico}",
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
                    maxLines: 5,
                    textAlignVertical: TextAlignVertical.top,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controllerA.observaciones,
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
