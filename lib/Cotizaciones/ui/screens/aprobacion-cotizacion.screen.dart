import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupoLias/Cotizaciones/controller/aprobacion-cotizacion.controller.dart';
import 'package:grupoLias/Cotizaciones/model/cotizacion.model.dart';

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
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.timer, size: 100),
              const Text(
                "Diagnóstico",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Cotización ${cotizacion?.diagnosticoProblema}",
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
                "Solucion ${cotizacion?.solucionTecnico}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                "Mano de obra",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${cotizacion?.costoManoObra}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                "Materiales",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${cotizacion?.costoMateriales}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                "Total",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${cotizacion?.totalCotizacion}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              const Text(
                "Tiempo transcurrido desde que se envio: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Calculo de tiempo transcurrido

              Obx(
                () => controller.minutos >= 10
                    ? Text(
                        "${controller.minutos} minutos",
                        style: const TextStyle(fontSize: 20),
                      )
                    : Text(
                        "${controller.tiempoTranscurridoMsg}",
                        style: const TextStyle(fontSize: 20),
                      ),
              ),
              const SizedBox(height: 10),
              // ignore: prefer_const_constructors
              MaterialButton(
                minWidth: double.maxFinite,
                height: 50,
                color: Colors.black,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.lock_clock),
                    Text(
                      "Esperando aprobacion",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onPressed: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
