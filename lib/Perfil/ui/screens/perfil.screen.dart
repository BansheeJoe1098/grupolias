import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/perfil.controller.dart';
import '../widgets/perfil-img-picker.widget.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final controller = Get.put(PerfilController());
  @override
  void initState() {
    super.initState();
    controller.getFotoPerfil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'GRUPO LIAS',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        actions: const <Widget>[
          ImageIcon(
            AssetImage('assets/gpolias.png'),
            size: 80,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 50.0, top: 50.0, right: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1))
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: GetBuilder<PerfilController>(builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: controller.imagenUsuarioLoguado == null
                            ? Image.asset(
                                'assets/gpolias.png',
                                height: 200,
                                width: 200,
                              )
                            : Image.network(
                                "${controller.imagenUsuarioLoguado}",
                                height: 200,
                                width: 200,
                              ),
                      );
                    }),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        showBottomSheet(
                            context: context,
                            builder: ((builder) => PerfilImgPicker(
                                  perfilController: controller,
                                )));
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.black),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'Jose Garcia',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              '4431256540',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Plomero\nElectricista',
              style: TextStyle(
                color: Color.fromARGB(255, 102, 100, 100),
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Mexico,DF',
              style: TextStyle(
                color: Color.fromARGB(255, 95, 94, 92),
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: const [
                Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'jose.garcia@flutter.prof',
                  style: TextStyle(
                      letterSpacing: 1.0, color: Colors.black, fontSize: 18.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
