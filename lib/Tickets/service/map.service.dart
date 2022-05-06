import 'package:url_launcher/url_launcher.dart';

class Mapita {
  Future<void> abrirMapa(double latitude, double longitude) async {
    longitude = 19.7214739;
    latitude = -101.1859148;
    Uri googleUrl = Uri.parse(
        'google.navigation:q=Instituto+Tecnológico+de+Morelia&avoid=tf');

    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(
        googleUrl,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not open the map.';
    }
  }
}
