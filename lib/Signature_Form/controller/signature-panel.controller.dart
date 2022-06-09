import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';
import 'package:grupoLias/Signature_Form/service/signature.service.dart';

import 'dart:io';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../AcuerdosConformidad/ui/screens/ver-acuerdo-firmado.screen.dart';

class SignatureControllerPanel extends GetxController {
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  late AcuerdoConformidad acuerdoConformidad;

  guardarSignature() async {
    ui.Image image = await signaturePadKey.currentState!.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List imageBytes = byteData!.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = '$path/Firma.png';
    final File firmaComoPng = File(fileName);

    await firmaComoPng.writeAsBytes(imageBytes);

    SignatureService signatureService = SignatureService();
    var res =
        await signatureService.create(acuerdoConformidad.id!, firmaComoPng);

    if (res != null) {
      Get.to(() => VerAcuerdoFirmadoScreen(
          acuerdoConformidad: acuerdoConformidad, firma: firmaComoPng));
    } else {
      Get.snackbar(
        'Error',
        'Error al guardar la firma',
        duration: Duration(seconds: 2),
      );
    }
  }
}
