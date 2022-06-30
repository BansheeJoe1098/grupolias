import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraService {
  Future<File?> camara() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (image == null) {
      return null;
    }
    final File temporalFile = File(image.path);

    //save image on gallery
    var directory = await getApplicationDocumentsDirectory();

    var path = directory.path;
    var arrRuta = temporalFile.path.split('/');
    var nombreArchivo = arrRuta[arrRuta.length - 1];

    File savedImage = await temporalFile.copy('$path/$nombreArchivo');
    return savedImage;
  }
}
