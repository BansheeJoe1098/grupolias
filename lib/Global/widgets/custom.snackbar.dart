import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  final String titulo;
  final String descripcion;
  final Color color;

  CustomSnackBar({
    required this.titulo,
    required this.descripcion,
    required this.color,
  }) {
    Get.snackbar(
      titulo,
      descripcion,
      backgroundColor: color,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 8),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    );
  }
}
