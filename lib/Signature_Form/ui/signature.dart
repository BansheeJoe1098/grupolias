import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grupoLias/AcuerdosConformidad/model/acuerdo-conformidad.model.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../controller/signature-panel.controller.dart';

class Signature extends StatefulWidget {
  final AcuerdoConformidad? acuerdoDto;
  const Signature({Key? key, required this.acuerdoDto}) : super(key: key);

  @override
  State<Signature> createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();
  final controller = Get.put(SignatureControllerPanel());

  @override
  void initState() {
    super.initState();
    controller.acuerdoConformidad = widget.acuerdoDto!;
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
                          fontStyle: FontStyle.italic),
                    ),
                    onPressed: () async {
                      controller.guardarSignature(signaturePadKey);
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
        ),
      )),
    );
  }
}
