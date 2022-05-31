import 'dart:io';

import 'package:grupoLias/constants.dart';

class InternetService {
  Future<bool> checkConectionToServer() async {
    final result = await InternetAddress.lookup(Constants.API_URL);

    try {
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
