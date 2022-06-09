import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';
import 'package:grupoLias/Signature_Form/service/signature.service.dart';

import 'dart:io';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignatureControllerPanel extends GetxController {
  File? file;
  late AcuerdoConformidad acuerdoConformidad;

  guardarSignature(GlobalKey<SfSignaturePadState> signaturePadKey) async {
    ui.Image image = await signaturePadKey.currentState!.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List imageBytes = byteData!.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = '$path/Firma.png';
    final File firmaComoPng = File(fileName);

    SignatureService signatureService = SignatureService();
    await signatureService.create(acuerdoConformidad.id!, firmaComoPng);

    //await firmaComoPng.writeAsBytes(imageBytes, flush: true);
    //OpenFile.open(fileName);
  }
}
