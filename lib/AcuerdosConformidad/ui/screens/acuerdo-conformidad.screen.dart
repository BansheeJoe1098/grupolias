import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../controllers/acuerdo-conformidad.controller.dart';

class AcuerdoConformidadScreen extends StatefulWidget {
  final AcuerdoConformidadController controller;
  const AcuerdoConformidadScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<AcuerdoConformidadScreen> createState() =>
      _AcuerdoConformidadScreenState();
}

class _AcuerdoConformidadScreenState extends State<AcuerdoConformidadScreen> {
  late AcuerdoConformidadController controller;

  late int idTicket;
  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    controller.getTicketAcuerdo();
    //Translate date time to español
    Jiffy.locale("es_us");
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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () async {
          await controller.enviarAcuerdo();
        },
        label: Row(
          children: const [
            Text('Enviar  '),
            Icon(Icons.send),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: controller.observacionesFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Descripcion del Problema",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${controller.cotizacion.diagnosticoProblema}",
                        textAlign: TextAlign.justify,
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
                      Text(
                        "${controller.cotizacion.solucionTecnico}",
                        textAlign: TextAlign.justify,
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
                        " ${Jiffy(DateTime.now()).format("dd MMMM yyyy HH:mm")}",
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
                      const SizedBox(
                        height: 20,
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
                          labelText: 'Observaciones adicionales',
                          floatingLabelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 230, 230, 230),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.zero),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.zero),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
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
