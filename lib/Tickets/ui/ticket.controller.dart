import 'package:get/get.dart';

class TicketController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}
