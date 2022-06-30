// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grupolias/Cotizaciones/controllers/cotizaciones.controller.dart';

class CotizacionesScreen extends StatefulWidget {
  final CotizacionesController cotizacionesController;
  const CotizacionesScreen({Key? key, required this.cotizacionesController})
      : super(key: key);

  @override
  State<CotizacionesScreen> createState() => _CotizacionesScreenState();
}

class _CotizacionesScreenState extends State<CotizacionesScreen> {
  late CotizacionesController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.cotizacionesController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cotizacion"),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        actions: const [
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 100,
          ),
        ],
      ),
      floatingActionButton: Tooltip(
        message: "Enviar Cotización",
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            controller.submit(context);
          },
          child: const Icon(Icons.send),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.cotizacionFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Diagnóstico del problema 🦸‍♀️",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 5,
                      textAlignVertical: TextAlignVertical.top,
                      controller: controller.diagnosticoProblema,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return controller.validadorTextArea(value);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Diagnostico del problema ',
                        hintText:
                            'Ej: Se encontró cocodrilo en la alberca del domicilio',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Tomar foto del problema 📷",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: MaterialButton(
                          onPressed: () => controller.setFotoPreSolucion(),
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GetBuilder<CotizacionesController>(builder: (_) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: controller.fotoPresolucion == null
                                      ? Image.asset(
                                          'assets/gpolias.png',
                                          height: 200,
                                          width: 200,
                                        )
                                      : Image.file(
                                          controller.fotoPresolucion!,
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                );
                              }),
                              const Text('Tomar Foto'),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Solucion propuesta 💡",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLines: 5,
                      textAlignVertical: TextAlignVertical.top,
                      controller: controller.solucionTecnico,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return controller.validadorTextArea(value);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Solucion propuesta',
                        hintText: 'Ej: Se le realizó una limpieza a la alberca',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Costo de mano de obra 👷‍♂️",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.costoManoObra,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return controller.validadorCostos(value);
                      },
                      onChanged: (value) {
                        controller.setTotal();
                      },
                      decoration: const InputDecoration(
                        hintText: '0.00',
                        labelText: 'Costo Mano de obra',
                        prefixIcon: Icon(Icons.monetization_on_outlined),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Costo de materiales 📦",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller.costoMateriales,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return controller.validadorCostos(value);
                      },
                      onChanged: (value) {
                        controller.setTotal();
                      },
                      decoration: const InputDecoration(
                        hintText: '0.00',
                        labelText: 'Costo  Materiales',
                        prefixIcon: Icon(Icons.monetization_on_outlined),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Text(
                        'Total: ${controller.total}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
