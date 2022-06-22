import 'dart:async';

import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/model/cotizacion.model.dart';
import 'package:grupolias/Cotizaciones/service/cotizaciones.service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service/gps.service.dart';

class AprobacionCotizacionController extends GetxController {
  Rx<Cotizacion> cotizacion = Cotizacion().obs;
  //Tiempo transcurrido
  Rx<String> tiempoTranscurridoMsg = '0 mintos'.obs;
  Rx<int> minutos = 0.obs;
  var sePuedeAbrirMapa = false.obs;

  var urlMapa = "".obs;

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

  void lanzarMapa() async {
    // Uri googleUrl =
    //     Uri.parse('google.navigation:q=Tec+de+morelia&avoid=t');

    GPS.setPermisoGPS();
    var ubicacion = await GPS.getUbicacionActual();

    urlMapa.value =
        'https://www.google.com/maps/dir/${ubicacion.latitude},${ubicacion.longitude}/Instituto+Tecnologico+de+Morelia';

    Uri googleUrl = Uri.parse(urlMapa.value);

    sePuedeAbrirMapa.value = await canLaunchUrl(googleUrl);
    if (sePuedeAbrirMapa.value) {
      sePuedeAbrirMapa.value = true;
      await launchUrl(
        googleUrl,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } else {
      sePuedeAbrirMapa.value = false;
      // ignore: avoid_print
      print('Could not open the map.');
    }
  }
}
