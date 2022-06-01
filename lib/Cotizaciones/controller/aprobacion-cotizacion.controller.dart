import 'dart:async';

import 'package:get/get.dart';
import 'package:grupoLias/Cotizaciones/model/cotizacion.model.dart';

class AprobacionCotizacionController extends GetxController {
  Rx<Cotizacion> cotizacion = Cotizacion().obs;
  //Tiempo transcurrido
  Rx<String> tiempoTranscurridoMsg = 'Hace menos de un minuto'.obs;
  Rx<int> minutos = 0.obs;

  void calculoTiempoTranscurrido() {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      int mins =
          (DateTime.now().difference(cotizacion.value.createdAt!).inMinutes);
      if (mins > 1) {
        tiempoTranscurridoMsg.value = "$mins minutos";
      }
      if (mins > 10) {
        minutos.value = mins;
      }
      update();
    });
  }
}
