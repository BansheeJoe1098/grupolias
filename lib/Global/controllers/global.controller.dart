import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:grupolias/Global/services/auth.service.dart';
import 'package:grupolias/NavBar/ui/pluguin/navbar.dart';

class GlobalController extends GetxController {
  Rx<bool> isAuth = false.obs;

  Future<void> isAutenticado() async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');

    //Check if jwt is valid
    var service = AuthService();
    var isAuth = await service.checkSession(token);
    this.isAuth.value = isAuth;

    if (isAuth) {
      Get.off(() => const BasicBottomNavBar());
    }
  }
}
