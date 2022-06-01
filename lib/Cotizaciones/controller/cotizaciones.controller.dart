// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:grupoLias/Cotizaciones/model/create-cotizacion.dto.dart';
import 'package:grupoLias/Cotizaciones/ui/screens/aprobacion-cotizacion.screen.dart';
import 'package:grupoLias/Tickets/service/ticket.service.dart';

import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';
import '../model/cotizacion.model.dart';
import '../service/cotizaciones.service.dart';

class CotizacionesController extends GetxController {
  final cotizacionFormKey = GlobalKey<FormState>();

  var diagnosticoProblema = TextEditingController();
  var solucionTecnico = TextEditingController();
  var fechaContacto = TextEditingController();
  var costoManoObra = TextEditingController();
  var costoMateriales = TextEditingController();
  var totalCotizacion = TextEditingController();

  var ticketId = 0.obs;
  var total = 0.0.obs;
  File? foto;
  Rx<Cotizacion?> cotizacion = null.obs;

  Future<Cotizacion?> submit(BuildContext context) async {
    if (cotizacionFormKey.currentState!.validate() && foto != null) {
      cotizacionFormKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enviando')),
      );

      CreateCotizacionDto cot = CreateCotizacionDto(
        diagnosticoProblema: diagnosticoProblema.text,
        solucionTecnico: solucionTecnico.text,
        fechaContacto: DateTime.now().toUtc(),
        costoManoObra: double.parse(costoManoObra.text),
        costoMateriales: double.parse(costoMateriales.text),
        totalCotizacion: total.value,
        ticketId: ticketId.value,
        //TODO: Sacar id del tecnico desde la sesion
        tecnicoId: 1,
      );

      var cotizacionService = CotizacionesService();
      var ticketService = TicketService();
      try {
        var respuesta = await cotizacionService.create(cot, foto!);

        if (respuesta != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cotización enviada'),
            ),
          );
          await ticketService.setCotizado(ticketId.value);
          Get.to(AprobacionCotizacion(
            cotizacion: respuesta,
          ));
          return respuesta;
        }
      } catch (e) {
        printError(info: e.toString());
      }
    }
    return null;
  }

  Future<String?> tomarFoto() async {
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );
      if (image == null) {
        return null;
      }
      final File temporalFile = File(image.path);
      foto = temporalFile;

      //save image on gallery
      var directory = await getApplicationDocumentsDirectory();

      var path = directory.path;
      var arrRuta = foto!.path.split('/');
      var nombreArchivo = arrRuta[arrRuta.length - 1];

      File savedImage = await temporalFile.copy('$path/$nombreArchivo');

      foto = savedImage;
    } on PlatformException catch (e) {
      return "Error: Se necesita permisos de camara $e";
    }
    update();
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

  // Api Simulation
  Future<bool> checkUser(String user, String password) {
    if (user == 'foo@foo.com' && password == '123') {
      return Future.value(true);
    }
    return Future.value(false);
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
