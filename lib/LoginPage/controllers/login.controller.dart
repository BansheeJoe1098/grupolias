import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:grupolias/Global/services/auth.service.dart';

import '../../Home/ui/screens/home.screen.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var usuario = TextEditingController();
  var password = TextEditingController();

  login() async {
    var service = AuthService();
    var token = await service.login(usuario.text, password.text);

    if (token == null) {
      Get.snackbar(
          'NO AUTORIZADO, posibles causas:',
          '''-Credenciales incorrectas
          \n-Tecnico inactivo
          \nEn caso necesitar ayuda Contacte con el administrador''',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange[900],
          colorText: Colors.white,
          isDismissible: true,
          shouldIconPulse: true,
          duration: const Duration(seconds: 6),
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ));
    } else {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token.accessToken);

      await storage.read(key: 'token');

      Get.off(() => const Home());
    }
  }
}
