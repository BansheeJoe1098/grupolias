import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grupolias/AcuerdosConformidad/ui/screens/usuario-final.screen.dart';
import 'package:grupolias/Cotizaciones/controllers/aprobacion-cotizacion.controller.dart';
import 'package:grupolias/Cotizaciones/models/cotizacion.model.dart';
import 'package:grupolias/Home/ui/screens/home.screen.dart';
import 'package:grupolias/Tickets/ui/screens/ticket-detalles.screen.dart';

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
        actions: const [
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 50,
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
                Obx(
                  () {
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
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Get.offAll(
                                    () => UsuarioFinalScreen(
                                      cotizacion: cotizacion!,
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Realizar acuerdo de conformidad",
                                ),
                              ),
                            ],
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
