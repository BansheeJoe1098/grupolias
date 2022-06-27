import 'package:grupolias/Tickets/models/ticket.model.dart';
import 'package:url_launcher/url_launcher.dart';

class Mapita {
  Future<void> abrirMapa(Ticket? ticket) async {
    var calle = ticket?.calle.toString();
    var colonia = ticket?.colonia.toString();
    var ciudad = ticket?.ciudadId.toString();
    var numero = ticket?.numeroDomicilio.toString();

    calle = calle?.replaceAll(" ", "+");
    colonia = colonia?.replaceAll(" ", "+");
    ciudad = ciudad?.replaceAll(" ", "+");
    numero = numero?.replaceAll(" ", "+");

    var direccion = "$calle+$colonia+$numero+morelia";

    Uri googleUrl = Uri.parse('google.navigation:q=$direccion');

    if (await canLaunchUrl(googleUrl)) {
      // await launchUrl(
      //   googleUrl,
      //   mode: LaunchMode.externalApplication,
      // );
    } else {
      throw 'Could not open the map.';
    }
  }
}
