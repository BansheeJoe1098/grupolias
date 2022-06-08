import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';

class SignatureController extends GetxController {
  final signatureFromKey = GlobalKey<FormState>();

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }
}
