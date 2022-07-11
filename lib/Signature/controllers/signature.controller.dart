import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/AcuerdosConformidad/models/acuerdo-conformidad.model.dart';
import 'package:grupolias/AcuerdosConformidad/models/dto/acuerdo-conformidad-dto.model.dart';
import 'package:grupolias/AcuerdosConformidad/services/acuerdo-conformidad.service.dart';
import 'package:grupolias/Signature/services/signature.service.dart';

import 'dart:io';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../AcuerdosConformidad/ui/screens/ver-acuerdo-firmado.screen.dart';
import '../../Tickets/services/ticket.service.dart';

class SignatureController extends GetxController {
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  late AcuerdoConformidad acuerdoConformidad;
  late AcuerdoDto acuerdoDto;

  guardarAcuerdo() async {
    var service = AcuerdoService();
    var respuesta = await service.create(acuerdoDto);

    if (respuesta != null) {
      acuerdoConformidad = respuesta;
      Get.snackbar(
        "Exito",
        "Acuerdo Enviado",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );

      return respuesta;
    } else {
      Get.snackbar(
        "Error",
        "Error al enviar el acuerdo",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  guardarSignature() async {
    ui.Image image = await signaturePadKey.currentState!.toImage();
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List imageBytes = byteData!.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = '$path/Firma.png';
    final File firmaComoPng = File(fileName);

    await firmaComoPng.writeAsBytes(imageBytes);

    //Se guarda el aucero para obtener el id del acuerdo
    await guardarAcuerdo();

    //Se sube la firma para el acuerdo
    SignatureService signatureService = SignatureService();
    var res = await signatureService.create(
      acuerdoConformidad.id!,
      firmaComoPng,
    );

    if (res != null) {
      //Se configura el ticket como "A cerrar"
      var ticketService = TicketService();
      await ticketService.setACerrar(acuerdoConformidad.ticketId!);
      Get.to(
        () => VerAcuerdoFirmadoScreen(
          acuerdoConformidad: acuerdoConformidad,
        ),
      );
    } else {
      var service = AcuerdoService();
      await service.remove(acuerdoConformidad);
      Get.snackbar(
        'Error',
        'Error al firmar el acuerdo',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.back();
    }
  }
}
