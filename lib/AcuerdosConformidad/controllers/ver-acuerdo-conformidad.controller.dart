import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grupolias/Global/widgets/custom.snackbar.dart';

class VerAcuerdoConformidadController extends GetxController {
  var isLoading = false.obs;

  Future<PDFDocument?> loadDocument() async {
    try {
      PDFDocument document = await PDFDocument.fromURL(
          'https://www.ecma-international.org/wp-content/uploads/ECMA-262_12th_edition_june_2021.pdf');

      return document;
    } catch (e) {
      CustomSnackBar(
        titulo: 'Error al cargor el documento',
        descripcion: e.toString(),
        color: Colors.red,
      );
    }

    isLoading.value = false;

    return null;
  }
}
