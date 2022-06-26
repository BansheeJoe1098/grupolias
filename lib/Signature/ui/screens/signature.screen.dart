import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grupolias/AcuerdosConformidad/models/acuerdo-conformidad.model.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../controllers/signature.controller.dart';

class SignatureScreen extends StatefulWidget {
  final AcuerdoConformidad? acuerdoDto;
  const SignatureScreen({Key? key, required this.acuerdoDto}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final controller = Get.put(SignatureController());

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
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: SfSignaturePad(
                  key: controller.signaturePadKey,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  strokeColor: Colors.black,
                  minimumStrokeWidth: 2.0,
                  maximumStrokeWidth: 4.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      controller.signaturePadKey.currentState!.clear();
                    },
                    child: const Text('Limpiar'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () async {
                      controller.guardarSignature();
                    },
                    child: const Text("Confirmar"),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
