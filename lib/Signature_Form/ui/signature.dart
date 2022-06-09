import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:convert';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;

class Signature extends StatefulWidget {
  final AcuerdoConformidad acuerdoDto;
  const Signature({Key? key, required this.acuerdoDto}) : super(key: key);

  @override
  State<Signature> createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  late AcuerdoConformidad acuerdoDto;

  @override
  void initState() {
    super.initState();
    acuerdoDto = widget.acuerdoDto;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: SizedBox(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 10, color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: SfSignaturePad(
                  key: signaturePadKey,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  strokeColor: Colors.black,
                  minimumStrokeWidth: 2.0,
                  maximumStrokeWidth: 4.0,
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: const Text("Confirmar"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontStyle: FontStyle.italic)),
                    onPressed: () async {
                      ui.Image image =
                          await signaturePadKey.currentState!.toImage();
                      final byteData = await image.toByteData(
                          format: ui.ImageByteFormat.png);
                      final Uint8List imageBytes = byteData!.buffer.asUint8List(
                          byteData.offsetInBytes, byteData.lengthInBytes);

                      final String path =
                          (await getApplicationSupportDirectory()).path;
                      final String FileName = '$path/Firma.png';
                      final File file = File(FileName);
                      await file.writeAsBytes(imageBytes, flush: true);
                      OpenFile.open(FileName);
                    },
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontStyle: FontStyle.italic)),
                      onPressed: () {
                        signaturePadKey.currentState!.clear();
                      },
                      child: const Text('Limpiar'))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              )
            ],
          ),
          //height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
        ),
      )),
    );
  }
}
