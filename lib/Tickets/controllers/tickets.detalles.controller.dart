import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Global/widgets/custom.snackbar.dart';
import 'package:grupolias/Home/ui/screens/home.screen.dart';

import '../models/ticket.model.dart';
import '../services/ticketDetalles.service.dart';
import '../ui/screens/map.screen.dart';

class TicketsDetallesController extends GetxController {
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

      Get.to(
        () => MapScreen(idTicket: t.id!),
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
