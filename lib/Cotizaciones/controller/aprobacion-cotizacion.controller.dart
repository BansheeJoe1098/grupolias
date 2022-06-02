import 'dart:async';

import 'package:get/get.dart';
import 'package:grupoLias/Cotizaciones/model/cotizacion.model.dart';
import 'package:grupoLias/Cotizaciones/service/cotizaciones.service.dart';

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
      int mins =
          (DateTime.now().difference(cotizacion.value.createdAt!).inMinutes);
      if (mins > 1) {
        tiempoTranscurridoMsg.value = "$mins minutos";
      }
      update();
    });
  }

  void checkEstadoCotizacion() async {
    int idCot = cotizacion.value.id!;

    try {
      var resCotizacion = await CotizacionesService().statusCotizacion(idCot);
      cotizacion.value = resCotizacion!;
    } catch (e) {
      print(e);
    }
  }
}
