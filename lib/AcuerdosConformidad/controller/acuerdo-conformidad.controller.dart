import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.dto.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';
import 'package:grupoLias/Signature_Form/ui/signature.dart';
import 'package:grupoLias/Tickets/service/ticket.service.dart';

import '../../Cotizaciones/model/cotizacion.model.dart';
import '../../Tickets/model/ticket.model.dart';
import '../service/acuerdo-conformidad.service.dart';

class AcuerdoConformidadController extends GetxController {
  late Cotizacion cotizacion;
  late Ticket ticket;
  final acuerdoFormKey = GlobalKey<FormState>();

  var observaciones = TextEditingController();

  File? foto;
  Rx<AcuerdoConformidad?> acuerdo = null.obs;

  Future<AcuerdoConformidad?> submit(BuildContext context) async {
    if (acuerdoFormKey.currentState!.validate()) {
      acuerdoFormKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enviando')),
      );
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
        direccion: ticket.calle!.toString() +
            ' ' +
            ticket.numeroDomicilio!.toString() +
            ' ' +
            ticket.colonia!.toString(),
      );
      var service = AcuerdoService();
      var acuerdo = await service.create(acuerdoDTO);

      print(acuerdo!.toRawJson());

      var respuesta = await service.create(acuerdoDTO);

      if (respuesta != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Acuerdo enviada'),
          ),
        );

        Get.to(() => Signature(acuerdoDto: acuerdo));
        // var acuerdoService = AcuerdoService();
        // var ticketService = TicketService();

        // try {
        //   var respuesta = await acuerdoService.create(cot, foto!);

        //   if (respuesta != null) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(
        //         content: Text('Acuerdo enviada'),
        //       ),
        //     );

        //     Get.to(AcuerdoConformidad());

        //     return respuesta;
        //   }
        // } catch (e) {
        //   printError(info: e.toString());
        // }
      }
    }
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
