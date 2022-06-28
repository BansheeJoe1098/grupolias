import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:grupolias/Global/services/auth.service.dart';
import 'package:grupolias/Home/ui/screens/home.screen.dart';
import 'package:grupolias/Perfil/services/tecnico.service.dart';

import '../../Perfil/models/tecnico.model.dart';
import '../models/user.model.dart';
import '../services/user.service.dart';

class GlobalController extends GetxController {
  Rx<bool> isAuth = false.obs;
  Rx<User?> usuarioLogueado = User().obs;
  Rx<Tecnico?> tecnicoLogueado = Tecnico().obs;

  Future<void> isAutenticado() async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: 'token');

    //Check if jwt is valid
    var service = AuthService();
    var isAuth = await service.checkSession(token);
    this.isAuth.value = isAuth;

    if (isAuth) {
      Get.off(() => const Home());
    }
  }

  Future<User?> getUsuarioLogueado() async {
    UserService service = UserService();
    User? user = await service.getUsuarioLogueado();

    if (user != null) {
      usuarioLogueado.value = user;
      await getTecnicoByUserId(user.id!);
      return user;
    }

    return null;
  }

  Future<Tecnico?> getTecnicoByUserId(int id) async {
    TecnicoService service = TecnicoService();
    Tecnico? tecnico = await service.getTecnicoByUserId(id);

    if (tecnico != null) {
      tecnicoLogueado.value = tecnico;
      return tecnico;
    }
    return null;
  }
}
