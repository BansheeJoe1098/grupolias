import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Global/controllers/global.controller.dart';

import '../../controllers/perfil.controller.dart';
import '../widgets/perfil-img-picker.widget.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final controller = Get.put(PerfilController());
  final globalController = Get.put(GlobalController());
  @override
  void initState() {
    super.initState();
    controller.getFotoPerfil();
    globalController.getUsuarioLogueado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        tooltip: 'Cerrar sesión',
        onPressed: () => controller.logout(),
        child: const Icon(
          Icons.exit_to_app,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Tu Perfil',
          style: TextStyle(
            fontSize: 20.0,
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
                      border: Border.all(
                        width: 4,
                        color: Colors.black,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: GetBuilder<PerfilController>(builder: (_) {
                      return ClipOval(
                        //padding: const EdgeInsets.all(8.0),
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
                                fit: BoxFit.cover,
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
                          //El image picker muesta las opciones para cambiar foto
                          builder: ((builder) => PerfilImgPicker(
                                perfilController: controller,
                              )),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white,
                          ),
                          color: Colors.black,
                        ),
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
            Text(
              'Nombre:',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(
              () => Text(
                '''${globalController.tecnicoLogueado.value?.nombre} ${globalController.tecnicoLogueado.value?.apellidoPaterno} ${globalController.tecnicoLogueado.value?.apellidoMaterno}
                ''',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
            ),
            const Text(
              'Telefono:',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(
              () => Text(
                '${globalController.tecnicoLogueado.value?.telefono}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Servicios que ofreces:",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: globalController.listaServicios(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Localidad:',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(
              () => Text(
                '${globalController.ciudadTecnico.value?.nombre} - ${globalController.estadoTecnico.value?.nombre}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Correo Electronico:',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Obx(
                  () => Text(
                    '${globalController.usuarioLogueado.value?.email}',
                    style: const TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.black,
                        fontSize: 18.0),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
