import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Global/widgets/custom.snackbar.dart';
import '../../controllers/cotizaciones.controller.dart';
import '../screens/cotizaciones.screen.dart';
import '../widgets/boton-tomar-foto.widget.dart';

class FotoPlacasScreen extends StatefulWidget {
  final CotizacionesController cotizacionesController;
  const FotoPlacasScreen({Key? key, required this.cotizacionesController})
      : super(key: key);

  @override
  State<FotoPlacasScreen> createState() => _FotoPlacasScreenState();
}

class _FotoPlacasScreenState extends State<FotoPlacasScreen> {
  late CotizacionesController controller;
  late int idTicket;
  @override
  void initState() {
    super.initState();
    controller = widget.cotizacionesController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () => {
          controller.fotoLlegada == null
              ? CustomSnackBar(
                  titulo: "Tome foto de las placas del auto",
                  descripcion:
                      "Nececita tomar una foto de llegada para cotizar ticket",
                  color: Colors.red,
                )
              : Get.to(
                  () => CotizacionesScreen(
                    cotizacionesController: controller,
                  ),
                )
        },
        label: const Text("Siguiente"),
        icon: const Icon(Icons.navigate_next),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: const [
            Text("Foto de placas"),
            Spacer(),
            ImageIcon(
              AssetImage('assets/gpolias.png'),
              size: 50,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Toma foto de las placas del auto",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        controller.setFotoPlacas();
                      },
                      child: GetBuilder<CotizacionesController>(builder: (_) {
                        return controller.fotoPlacas == null
                            ? const BotonTomarFoto()
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.file(controller.fotoPlacas!),
                              );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
