// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:grupolias/Cotizaciones/models/create-cotizacion.dto.dart';
import 'package:grupolias/Cotizaciones/ui/screens/aprobacion-cotizacion.screen.dart';
import 'package:grupolias/Global/services/camera.service.dart';
import 'package:grupolias/Global/widgets/custom.snackbar.dart';
import 'package:grupolias/Tickets/services/ticket.service.dart';
import '../../Tickets/models/ticket.model.dart';
import '../models/cotizacion.model.dart';
import '../services/cotizaciones.service.dart';

class CotizacionesController extends GetxController {
  final cotizacionFormKey = GlobalKey<FormState>();

//Controles del formulario de cotizacion
  var diagnosticoProblema = TextEditingController();
  var solucionTecnico = TextEditingController();
  var fechaContacto = TextEditingController();
  var costoManoObra = TextEditingController();
  var costoMateriales = TextEditingController();
  var totalCotizacion = TextEditingController();

//Id del ticket de la cotizacion
  var ticketId = 0.obs;
  var total = 0.0.obs;
  //Fotos relacionadas con la cotizacion
  File? fotoLlegada;
  File? fotoPresolucion;
  File? fotoPlacas;
  Rx<Cotizacion?> cotizacion = null.obs;
  Rx<Ticket> ticket = Ticket().obs;

  Future<Cotizacion?> submit(BuildContext context) async {
    if (cotizacionFormKey.currentState!.validate() && fotoPresolucion != null) {
      cotizacionFormKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enviando')),
      );

      var payload = CreateCotizacionDto(
        diagnosticoProblema: diagnosticoProblema.text,
        solucionTecnico: solucionTecnico.text,
        fechaContacto: DateTime.now().toUtc(),
        costoManoObra: double.parse(costoManoObra.text),
        costoMateriales: double.parse(costoMateriales.text),
        totalCotizacion: total.value,
        ticketId: ticket.value.id,
        tecnicoId: ticket.value.tecnicoId,
      );

      try {
        var cotizacionService = CotizacionesService();
        var respuesta = await cotizacionService.create(
          payload,
          ticket.value.asistenciaVial!,
          fotoPresolucion!,
          fotoLlegada!,
          fotoPlacas,
        );

        if (respuesta != null) {
          CustomSnackBar(
            titulo: "Exito",
            descripcion: "Cotizacion Enviada con exito",
            color: Colors.green,
          );

          TicketService ticketService = TicketService();
          await ticketService.setCotizado(ticketId.value);

          Get.offAll(
            () => AprobacionCotizacion(
              cotizacion: respuesta,
            ),
          );

          return respuesta;
        }
      } catch (e) {
        printError(info: e.toString());
      }
    }
    return null;
  }

  Future<String?> setFotoPreSolucion() async {
    try {
      //Se toma la imagen desde la camara
      CameraService service = CameraService();
      File? saved = await service.camara();

      fotoPresolucion = saved;
    } on PlatformException catch (e) {
      return "Error: Se necesita permisos de camara $e";
    }
    update();
    return null;
  }

  Future<String?> setFotoLlegada() async {
    try {
      //Se toma la imagen desde la camara
      CameraService service = CameraService();
      File? savedImage = await service.camara();

      fotoLlegada = savedImage;
    } on PlatformException catch (e) {
      return "Error: Se necesita permisos de camara $e";
    }
    update();
    return null;
  }

  Future<String?> setFotoPlacas() async {
    try {
      //Se toma la imagen desde la camara
      CameraService service = CameraService();
      File? savedImage = await service.camara();

      fotoPlacas = savedImage;
    } on PlatformException catch (e) {
      return "Error: Se necesita permisos de camara $e";
    }
    update();
    return null;
  }

  Future<Ticket?> getTicket() async {
    var ticketService = TicketService();
    var ticket = await ticketService.getTicketById(ticketId.value);

    return this.ticket.value = ticket;
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

  String? validadorCostos(String? value) {
    if (value!.isEmpty) {
      return 'Este campo es requerido';
    }
    if (!value.isNum) {
      return 'Este campo debe ser un número';
    }

    try {
      if (value.isNum && double.parse(value) < 0) {
        return 'Por favor ingrese un valor mayor a 0';
      }
    } catch (e) {
      return 'Este campo debe ser un número';
    }
    return null;
  }

  setTotal() {
    var costoMateriales = this.costoMateriales.text;
    var costoManoObra = this.costoManoObra.text;

    if (costoMateriales.isNotEmpty && costoManoObra.isNotEmpty) {
      try {
        var costMat = double.parse(costoMateriales);
        var costMano = double.parse(costoManoObra);
        total.value = (costMat + costMano);
        total.value = total.value.toPrecision(2);
      } catch (e) {
        total.value = 0;
      }
    }
  }

  @override
  void onClose() {
    diagnosticoProblema.dispose();
    solucionTecnico.dispose();
    fechaContacto.dispose();
    costoManoObra.dispose();
    costoMateriales.dispose();
    totalCotizacion.dispose();
    super.onClose();
  }
}
