import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/models/cotizacion.model.dart';
import 'package:grupolias/Cotizaciones/services/cotizaciones.service.dart';
import 'package:grupolias/Global/widgets/custom.snackbar.dart';
import 'package:grupolias/Home/ui/screens/home.screen.dart';
import 'package:grupolias/Tickets/services/ticket.service.dart';

import '../models/ticket.model.dart';
import '../services/ticket-detalles.service.dart';

class TicketsDetallesController extends GetxController {
  var ticket = Ticket().obs;
  Rx<Cotizacion?> cotizacion = Cotizacion().obs;

  void getTicket(int idTicket) async {
    Ticket? t = await TicketService().getTicketById(idTicket);
    ticket.value = t;
    update();
  }

  Future<Cotizacion?> getCotizacionByIdTicket(int idTicket) async {
    try {
      Cotizacion? cot =
          await CotizacionesService().getCotizacionByTicket(idTicket);
      cotizacion.value = cot;

      update();
      return cot;
    } catch (e) {
      CustomSnackBar(
        titulo: "Error: ${e.toString()}",
        descripcion: "Error al consultar la cotizacion",
        color: Colors.red,
      );
      return null;
    }
  }

  void tomarTicket(Ticket t) async {
    try {
      //Se hace el json requerido
      var data = jsonEncode(<String, dynamic>{
        "estado": "TOMADO",
        "tecnicoId": 1 //TODO: TOMAR ID DEL TECNICO LOGUEADO
      });

      //Manda la actualizacion a la API
      await TicketDetallesService().tomarTicket(
        t.id!,
        data.toString(),
      );

      CustomSnackBar(
        titulo: "Haz tomado el ticket ${t.numExpediente}",
        descripcion: "Dirigete a la ubicacion del usuario para cotizarlo",
        color: Colors.green,
      );

      Get.offAll(
        () => const Home(
          itemScreen: 1,
        ),
      );
    } catch (e) {
      CustomSnackBar(
        titulo: "Fallo al realizar actualizacion",
        descripcion: "$e",
        color: Colors.red,
      );

      const Duration(seconds: 1);

      Get.to(
        () => const Home(),
      );
    }
  }
}
