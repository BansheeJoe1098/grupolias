import 'dart:async';

import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/models/cotizacion.model.dart';
import 'package:grupolias/Cotizaciones/services/cotizaciones.service.dart';
import 'package:grupolias/Tickets/models/ciudad.model.dart';
import 'package:grupolias/Tickets/models/ticket.model.dart';
import 'package:grupolias/Tickets/services/ciudad.service.dart';
import 'package:grupolias/Tickets/services/ticket.service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/gps.service.dart';

class AprobacionCotizacionController extends GetxController {
  Rx<Cotizacion> cotizacion = Cotizacion().obs;
  //Tiempo transcurrido
  Rx<String> tiempoTranscurridoMsg = '0 mintos'.obs;
  Rx<int> minutos = 0.obs;
  var sePuedeAbrirMapa = true.obs;

  var urlMapa = "".obs;

  void calculoTiempoTranscurrido() async {
    int mins =
        (DateTime.now().difference(cotizacion.value.createdAt!).inMinutes);
    tiempoTranscurridoMsg.value = "$mins minutos";
    Timer.periodic(const Duration(seconds: 10), (timer) {
      checkEstadoCotizacion();
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

  void lanzarMapa(int ticketId) async {
    // Uri googleUrl =
    //     Uri.parse('google.navigation:q=Tec+de+morelia&avoid=t');

    GPS.setPermisoGPS();
    var ubicacion = await GPS.getUbicacionActual();

    //Se obtienen datos del ticket
    TicketService ticketSservice = TicketService();
    Ticket? ticket = await ticketSservice.getTicketById(ticketId);

    CiudadService ciudadService = CiudadService();
    Ciudad? ciudad = await ciudadService.getCiudadById(ticket.ciudadId);

    var direccion = '';

    //Si el ticket tiene la colonia vacia
    //forma una URL de direcciones cuyo destino son coordenadas
    if (ticket.colonia == "") {
      direccion = "${ticket.calle}";
      direccion = direccion.replaceAll(" ", "");
    } else {
      //En caso de que no este vacio, se forma una url con una direccion
      direccion =
          "${ticket.calle}+${ticket.colonia}+${ticket.numeroDomicilio}+${ciudad.nombre}";
      direccion = direccion.replaceAll(" ", "+");
    }

    //Url que se desplegara a google maps
    urlMapa.value =
        'https://www.google.com/maps/dir/${ubicacion.latitude},${ubicacion.longitude}/$direccion';

    Uri url = Uri.parse(urlMapa.value);

    sePuedeAbrirMapa.value = await canLaunchUrl(url);
    if (sePuedeAbrirMapa.value) {
      sePuedeAbrirMapa.value = true;
      await launchUrl(
        url,
        mode: LaunchMode.externalNonBrowserApplication,
      );
    } else {
      sePuedeAbrirMapa.value = false;
      // ignore: avoid_print
      print('No se puede abrir el mapa en este dispositivo.');
    }
  }
}
