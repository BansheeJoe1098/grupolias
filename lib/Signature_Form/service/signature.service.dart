import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:grupoLias/Signature_Form/ui/signature.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';

import '../../constants.dart';

class SignatureSetvice {
  String imgensurlf = '${Constants.API_URL}/imagenes';

  Future<Signature?> create(File file) async {
    var dio = Dio();
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;

    String nombrefirma = file.path.split('/').last;
    String ext = file.path.split('.').last;
  }
}
