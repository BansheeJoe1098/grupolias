import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.dto.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';
import 'package:grupoLias/AcuerdosConformidad/service/acuerdo-conformidad.service.dart';
import 'package:grupoLias/Tickets/service/ticket.service.dart';

class AcuerdosController extends GetxController {
  final acuerdoFormKey = GlobalKey<FormState>();

  var observaciones = TextEditingController();
  var fechaAcuerdo = TextEditingController();
  var horaRecepcion = TextEditingController();

  File? foto;
  Rx<AcuerdoConformidad?> cotizacion = null.obs;

  Future<AcuerdoConformidad?> submit(BuildContext context) async {
    if (acuerdoFormKey.currentState!.validate() && foto != null) {
      acuerdoFormKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enviado')),
      );
      CreateAcuerdoConformidadDto cot = CreateAcuerdoConformidadDto(
        observaciones: observaciones.text,
        fechaAcuerdo: DateTime.now().toUtc(),
        usuarioFinalId: 1,
      );
      var acuerdoService = AcuerdoService();
      var ticketService = TicketService();

      try {
        var respuesta = await acuerdoService.create(cot, foto!);

        if (respuesta != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Acuerdo enviada'),
            ),
          );

          Get.to(AcuerdoConformidad());

          return respuesta;
        }
      } catch (e) {
        printError(info: e.toString());
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
    }
  }
}
