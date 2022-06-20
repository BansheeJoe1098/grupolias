import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/AcuerdosConformidad/model/acuerdo-conformidad.dto.dart';
import 'package:grupolias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';
import 'package:grupolias/Signature_Form/ui/signature.dart';
import 'package:grupolias/Tickets/service/ticket.service.dart';

import '../../Cotizaciones/model/cotizacion.model.dart';
import '../../Tickets/model/ticket.model.dart';
import '../service/acuerdo-conformidad.service.dart';

class AcuerdoConformidadController extends GetxController {
  late Cotizacion cotizacion;
  late Ticket ticket;
  final acuerdoFormKey = GlobalKey<FormState>();

  var observaciones = TextEditingController();

  File? fotofirma;
  late Rx<AcuerdoConformidad?> acuerdo;

  Future<AcuerdoConformidad?> submit(BuildContext context) async {
    if (acuerdoFormKey.currentState!.validate()) {
      acuerdoFormKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enviando')),
      );

      //---------------Se envia registro de acuerdo -----------------//
      AcuerdoDto acuerdoDTO = AcuerdoDto(
        descripcionProblema: cotizacion.diagnosticoProblema,
        actividadesRealizadas: cotizacion.solucionTecnico,
        horaFinalizacionServicio: DateTime.now().toUtc(),
        observaciones: observaciones.text,
        horaRecepcionServicio: ticket.createdAt,
        horaLlegadaServicio: cotizacion.createdAt,
        fechaAcuerdo: DateTime.now().toUtc(),
        acuerdoFirmado:
            "FALTA FIRMA DESDE FLUTTER", //TODO: Acomodar la vaina de la firma
        ticketId: ticket.id,
        usuarioFinalId: 1, //TODO: Cambiar por el usuario final
        direccion:
            '${ticket.calle!} ${ticket.numeroDomicilio!} ${ticket.colonia!}',
      );

      var service = AcuerdoService();
      var respuesta = await service.create(acuerdoDTO);

      //---------------Se firma el acuerdo -----------------//
      if (respuesta != null) {
        Get.to(() => Signature(acuerdoDto: respuesta));
      } else {
        Get.snackbar(
          "Error",
          "Error al enviar el acuerdo",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );

        return null;
      }

      Get.snackbar(
        "Exito",
        "Acuerdo Enviado",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );

      var ticketService = TicketService();
      await ticketService.setACerrar(ticket.id!);
    }
    return null;
  }

  String? validadorTextArea(String? value) {
    var tamano = value?.length;
    if (tamano! < 20) {
      return 'Faltan ${20 - tamano} caracteres para tener una buena descripcion';
    }
    if (value!.isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }

  void getTicketAcuerdo() async {
    TicketService service = TicketService();
    var ticket = await service.getTicketById(cotizacion.ticketId!);
    this.ticket = ticket;
  }
}
