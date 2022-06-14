import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';
import 'package:grupoLias/Cotizaciones/controller/aprobacion-cotizacion.controller.dart';
import 'package:grupoLias/Cotizaciones/model/cotizacion.model.dart';
import 'package:grupoLias/NavBar/ui/pluguin/navbar.dart';
import 'package:grupoLias/AcuerdosConformidad/ui/screens/acuerdo-conformidad.screen.dart';

class AprobacionCotizacion extends StatefulWidget {
  final Cotizacion cotizacion;
  const AprobacionCotizacion({Key? key, required this.cotizacion})
      : super(key: key);

  @override
  State<AprobacionCotizacion> createState() => _AprobacionCotizacionState();
}

class _AprobacionCotizacionState extends State<AprobacionCotizacion> {
  late Cotizacion? cotizacion;
  final controller = Get.put(AprobacionCotizacionController());
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
        title: const Text("A espera de aprobación"),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(BasicBottomNavBar());
              },
              icon: Icon(Icons.home)),
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 80,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.timer,
                  size: 100,
                ),
                const Text(
                  "Diagnóstico",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  " ${cotizacion?.diagnosticoProblema}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Solucion",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " ${cotizacion?.solucionTecnico}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                const Text(
                  "Mano de obra",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //Calculo de tiempo transcurrido

                Obx(
                  () => controller.minutos <= 10
                      ? Text(
                          "${controller.minutos} minutos",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          "${controller.tiempoTranscurridoMsg}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return controller.cotizacion.value.isAprobado == false
                      ? const Text(
                          "Esperando aprobación",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Aprobado",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              child: const Text("Acuerdo de conformidad"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black),
                              onPressed: () {
                                Get.to(AcuerdoConformidadScreen(
                                  cotizacion: controller.cotizacion.value,
                                ));
                              },
                            ),
                          ],
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
