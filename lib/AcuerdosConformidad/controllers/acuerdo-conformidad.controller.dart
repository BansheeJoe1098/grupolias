import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/AcuerdosConformidad/models/acuerdo-final.model.dart';
import '../../AcuerdosConformidad/models/dto/acuerdo-conformidad-dto.model.dart';
import '../../AcuerdosConformidad/models/acuerdo-conformidad.model.dart';
import '../../AcuerdosConformidad/models/dto/usuario-final-dto.model.dart';
import '../../AcuerdosConformidad/services/usuario-final.service.dart';
import '../../AcuerdosConformidad/ui/screens/acuerdo-conformidad.screen.dart';

import '../../Tickets/services/ticket.service.dart';
import '../../Tickets/models/ticket.model.dart';

import '../../Cotizaciones/models/cotizacion.model.dart';

import '../../Signature/ui/screens/signature.screen.dart';

class AcuerdoConformidadController extends GetxController {
  var cotizacion = Cotizacion();
  var ticket = Ticket();
  Rx<UsuarioFinal?> usuarioFinal = UsuarioFinal().obs;

  //Acuerdo de conformidad
  final observacionesFormKey = GlobalKey<FormState>();
  var acuerdoConformidad = AcuerdoConformidad().obs;

  //Iamgen de la fima del acuerdo
  File? imagenFirma;

  //Controles del formulario de observaciones
  var observaciones = TextEditingController();

  //Controles del formulario de usuario final
  final usuarioFinalFormKey = GlobalKey<FormState>();

  var nombreUsuario = TextEditingController();
  var aPaterno = TextEditingController();
  var aMaterno = TextEditingController();
  var email = TextEditingController();
  var telefono = TextEditingController();

  void enviarUsuarioFinal() async {
    if (usuarioFinalFormKey.currentState!.validate()) {
      usuarioFinalFormKey.currentState!.save();

      var paload = UsuarioFinalDto(
        telefono: telefono.text.split(' ').join(''),
        nombre: nombreUsuario.text,
        apellidoPaterno: aPaterno.text,
        apellidoMaterno: aMaterno.text,
        correo: email.text == "" ? null : email.text.split(' ').join(''),
      );

      var service = UsuarioFinalService();
      UsuarioFinal? respuesta = await service.create(paload);

      if (respuesta != null) {
        usuarioFinal.value = respuesta;
        Get.to(
          () => AcuerdoConformidadScreen(
            controller: this,
          ),
        );
      }
    }
  }

  Future<AcuerdoConformidad?> enviarAcuerdo() async {
    if (observacionesFormKey.currentState!.validate()) {
      observacionesFormKey.currentState!.save();

      //---------------Se envia registro de acuerdo -----------------//
      AcuerdoDto acuerdoDTO = AcuerdoDto(
        descripcionProblema: cotizacion.diagnosticoProblema,
        actividadesRealizadas: cotizacion.solucionTecnico,
        horaFinalizacionServicio: DateTime.now().toUtc(),
        observaciones: observaciones.text,
        horaRecepcionServicio: ticket.createdAt,
        horaLlegadaServicio: cotizacion.createdAt,
        fechaAcuerdo: DateTime.now().toUtc(),
        ticketId: ticket.id,
        usuarioFinalId: usuarioFinal.value?.id,
        direccion:
            '${ticket.calle!},${ticket.numeroDomicilio != "" ? ticket.numeroDomicilio : ""},${ticket.colonia! != "" ? ticket.colonia : ""}',
      );
      Get.to(() => SignatureScreen(acuerdoDto: acuerdoDTO));
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
