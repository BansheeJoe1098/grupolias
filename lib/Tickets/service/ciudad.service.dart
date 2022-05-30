import 'package:grupolias/constants.dart';
import 'package:http/http.dart' as http;

import '../model/ciudad.model.dart';

class CiudadService {
  String url = '${Constants.API_URL}/ciudades';

  Future<Ciudad> getCiudadById(int? id) async {
    final response = await http.get(Uri.parse('$url/$id'));

    return Ciudad.fromRawJson(response.body);
  }
}
