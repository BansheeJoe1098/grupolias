import 'dart:async';

import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/model/cotizacion.model.dart';
import 'package:grupolias/Cotizaciones/service/cotizaciones.service.dart';

class AprobacionCotizacionController extends GetxController {
  Rx<Cotizacion> cotizacion = Cotizacion().obs;
  //Tiempo transcurrido
  Rx<String> tiempoTranscurridoMsg = '0 mintos'.obs;
  Rx<int> minutos = 0.obs;

  void calculoTiempoTranscurrido() async {
    int mins =
        (DateTime.now().difference(cotizacion.value.createdAt!).inMinutes);
    tiempoTranscurridoMsg.value = "$mins minutos";
    Timer.periodic(const Duration(seconds: 30), (timer) {
      checkEstadoCotizacion();

      var creacionDelTicket = cotizacion.value.createdAt!;
      int mins = (DateTime.now().difference(creacionDelTicket).inMinutes);
      if (mins > 1) {
        tiempoTranscurridoMsg.value = "$mins minutos";
      }
      update();
    });
  }

  void checkEstadoCotizacion() async {
    try {
      int idCot = cotizacion.value.id!;
      var resCotizacion = await CotizacionesService().statusCotizacion(idCot);
      cotizacion.value = resCotizacion!;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
