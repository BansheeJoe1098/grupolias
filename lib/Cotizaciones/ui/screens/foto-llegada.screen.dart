import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Cotizaciones/ui/screens/cotizaciones.screen.dart';
import 'package:grupolias/Global/widgets/custom.snackbar.dart';

import '../../controllers/cotizaciones.controller.dart';
import '../widgets/boton-tomar-foto.widget.dart';

class FotoLlegadaScreen extends StatefulWidget {
  final int idTicket;
  const FotoLlegadaScreen({Key? key, required this.idTicket}) : super(key: key);

  @override
  State<FotoLlegadaScreen> createState() => _FotoLlegadaScreenState();
}

class _FotoLlegadaScreenState extends State<FotoLlegadaScreen> {
  late int idTicket;
  final controller = Get.put(CotizacionesController());

  @override
  void initState() {
    super.initState();
    idTicket = widget.idTicket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () => {
          controller.fotoLlegada == null
              ? CustomSnackBar(
                  titulo: "Tome foto de llegada",
                  descripcion:
                      "Nececita tomar una foto de llegada para cotizar ticket",
                  color: Colors.red,
                )
              : Get.to(
                  () => CotizacionesScreen(
                    idTicket: idTicket,
                  ),
                )
        },
        label: const Text("Realizar Cotización"),
        icon: const Icon(Icons.file_open),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: const [
            Text("Foto llegada"),
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
                "Toma foto de tu llegada",
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
                        controller.setFotoLlegada();
                      },
                      child: GetBuilder<CotizacionesController>(builder: (_) {
                        return controller.fotoLlegada == null
                            ? const BotonTomarFoto()
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.file(controller.fotoLlegada!),
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
