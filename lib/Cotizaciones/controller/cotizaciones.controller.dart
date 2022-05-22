// ignore_for_file: prefer_final_fields

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CotizacionesController extends GetxController {
  final cotizacionFormKey = GlobalKey<FormState>();

  var diagnosticoProblema = TextEditingController();
  var solucionTecnico = TextEditingController();
  var fechaContacto = TextEditingController();
  var costoManoObra = TextEditingController();
  var costoMateriales = TextEditingController();
  var totalCotizacion = TextEditingController();

  final int ticketId = 0;
  var total = 0.0.obs;
  File? foto;

  void submit(BuildContext context) {
    if (cotizacionFormKey.currentState!.validate()) {
      cotizacionFormKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  Future<String?> tomarFoto() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return null;
      }
      final temporalFile = File(image.path);
      foto = temporalFile;
    } on PlatformException catch (e) {
      return "Error: Se necesita permisos de camara $e";
    }
    update();
    return null;
  }

  String? validadorTextArea(String? value) {
    var tamano = value?.length;
    if (tamano! < 70) {
      return 'Faltan ${70 - tamano} caracteres para tener una buena descripcion';
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
