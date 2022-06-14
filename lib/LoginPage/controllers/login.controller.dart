import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:grupoLias/Global/services/auth.service.dart';

import '../../NavBar/ui/pluguin/navbar.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var usuario = TextEditingController();
  var password = TextEditingController();

  login() async {
    var service = AuthService();
    var token = await service.login(usuario.text, password.text);

    if (token == null) {
      Get.snackbar('Error', 'Usuario o contraseña incorrectos',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ));
    } else {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token.accessToken);

      var valor = await storage.read(key: 'token');

      Get.off(() => const BasicBottomNavBar());
    }
  }
}
