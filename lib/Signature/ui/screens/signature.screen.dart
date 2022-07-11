import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:grupolias/AcuerdosConformidad/models/dto/acuerdo-conformidad-dto.model.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../controllers/signature.controller.dart';

class SignatureScreen extends StatefulWidget {
  final AcuerdoDto? acuerdoDto;
  const SignatureScreen({Key? key, required this.acuerdoDto}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final controller = Get.put(SignatureController());

  @override
  void initState() {
    super.initState();
    controller.acuerdoDto = widget.acuerdoDto!;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [
        SystemUiOverlay.bottom,
      ],
    );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: "Regresar",
                  onPressed: () {
                    Get.back();
                  },
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              const Spacer(),
              FloatingActionButton(
                heroTag: "Borrar",
                onPressed: () {
                  controller.signaturePadKey.currentState!.clear();
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.backspace),
              ),
              const SizedBox(width: 30),
              FloatingActionButton(
                heroTag: "Enviar",
                onPressed: () async {
                  await controller.guardarSignature();
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.check),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                child: SfSignaturePad(
                  key: controller.signaturePadKey,
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  strokeColor: Colors.black,
                  minimumStrokeWidth: 2.0,
                  maximumStrokeWidth: 7.0,
                ),
              ),
            ],
          )),
    );
  }
}
