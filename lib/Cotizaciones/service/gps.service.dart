import 'package:location/location.dart';

class GPS {
  static Future<LocationData> getUbicacionActual() {
    Location location = Location();
    return location.getLocation();
  }

  static void setPermisoGPS() async {
    var location = Location();

    //Se pide que active el GPS

    var isGpsActivado = await location.serviceEnabled();

    if (!isGpsActivado) {
      location.requestService();

      if (!isGpsActivado) {
        return;
      }
    }

    //Se pide que le de permisos a la app de utilizar la ubicacion
    var permisosUbicacion = await location.hasPermission();

    if (permisosUbicacion == PermissionStatus.denied) {
      location.requestPermission();

      permisosUbicacion = await location.requestPermission();
      if (permisosUbicacion == PermissionStatus.granted) {
        return;
      }
    }
  }
}
