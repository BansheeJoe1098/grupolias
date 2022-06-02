import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';

class AcuerdoController extends GetxController {
  Rx<AcuerdoConformidad> acuerdoConformidad = AcuerdoConformidad().obs;
  //Tiempo transcurrido
  Rx<String> tiempoTranscurridoMsg = 'Hace menos de un minuto'.obs;
  Rx<int> minutos = 0.obs;

  void calculoTiempoTranscurrido() {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      int mins = (DateTime.now()
          .difference(acuerdoConformidad.value.createdAt!)
          .inMinutes);
      if (mins > 1) {
        tiempoTranscurridoMsg.value = "$mins minutos";
      }
      if (mins > 10) {
        minutos.value = mins;
      }
      update();
    });
  }
}
