import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:get/get.dart';

class VerAcuerdoConformidadController extends GetxController {
  var isLoading = false.obs;

  Future<PDFDocument?> loadDocument() async {
    try {
      PDFDocument document = await PDFDocument.fromURL(
          'https://www.ecma-international.org/wp-content/uploads/ECMA-262_12th_edition_june_2021.pdf');

      print(document);

      return document;
    } catch (e) {
      print(e);
    }

    isLoading.value = false;

    return null;
  }
}
