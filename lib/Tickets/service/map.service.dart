import 'package:grupoLias/Tickets/model/ticket.model.dart';
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

    var direccion = "$calle+$colonia+$numero+$ciudad";

    bool? isAsistenciaVial = ticket?.asistenciaVial;

    if (isAsistenciaVial!) {
      Uri url = Uri.parse('google.navigation:q=$calle&avoid=tf');
      if (await canLaunchUrl(url)) {
        // await launchUrl(url);
      } else {
        throw 'No se pudo abrir el mapa';
      }
    } else {
      Uri googleUrl = Uri.parse('google.navigation:q=$direccion&avoid=tf');

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
}
