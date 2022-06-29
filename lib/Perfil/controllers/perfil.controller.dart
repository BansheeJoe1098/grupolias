import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:grupolias/Perfil/services/tecnico.service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../Global/controllers/global.controller.dart';
import '../../Global/image.model.dart';
import '../../Global/models/user.model.dart';
import '../../Global/services/user.service.dart';
import '../../LoginPage/ui/screens/login.screen.dart';

class PerfilController extends GetxController {
  File? foto;

  String? imagenUsuarioLoguado;

  Imagen? imagen;
  Future<String?> tomarFoto(ImageSource imgSource) async {
    GlobalController globals = GlobalController();

    User? user = await globals.getUsuarioLogueado();

    try {
      final XFile? image = await ImagePicker().pickImage(
        source: imgSource,
        imageQuality: 30,
      );
      if (image == null) {
        return null;
      }
      final File temporalFile = File(image.path);
      foto = temporalFile;

      //save image on gallery
      var directory = await getApplicationDocumentsDirectory();

      var path = directory.path;
      var arrRuta = foto!.path.split('/');
      var nombreArchivo = arrRuta[arrRuta.length - 1];

      File savedImage = await temporalFile.copy('$path/$nombreArchivo');

      //Se sube la imagen de perfil del usaurio
      TecnicoService service = TecnicoService();
      imagen = await service.updateFotoPerfil(user!.id!, savedImage);

      if (imagen != null) {
        //Se actualiza el id de la imagen del usuario logueado
        user.imgPerfilId = imagen?.id;

        //Se actualiza el usuario en la base de datos
        UserService userService = UserService();
        await userService.updateUser(user.id!, user);
        getFotoPerfil();
      }

//Se muestra la imagen tomada en la screen de perfil
      foto = savedImage;
      //Se retorna la ruta de la imagen

      if (imagen != null) return imagen?.url;
    } on PlatformException catch (e) {
      return "Error: Se necesita permisos de camara $e";
    }
    update();
    return null;
  }

  void getFotoPerfil() async {
    //Se obtiene el usuario logueado
    GlobalController globals = GlobalController();
    User? user = await globals.getUsuarioLogueado();

    //Si no tiene foto de perfil
    if (user?.imgPerfilId == null) {
      //Se le asigna null a imagen de usuario logueado
      imagenUsuarioLoguado = null;
      return;
    }
    //Se obtiene la imagen del usuario logueado
    TecnicoService service = TecnicoService();
    Imagen? imagen = await service.getImagenPerfil(user!.imgPerfilId!);

    if (imagen != null) imagenUsuarioLoguado = imagen.url;
    update();
  }

  void logout() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    Get.offAll(() => const LoginScreen());
  }
}
