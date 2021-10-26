import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyALACdVRn6BiOL23nv3cSnzjuRPDDSwpuw';

  Future<List<dynamic>> getPlaces(double lat, double lng) async {
    print('Burdayım $key');
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=veterinary_care&rankby=distance&regions&key=$key'));
    var json = convert.jsonDecode(response.body);

    var jsonResults = json['results'] as List;
    // print('Burdayım ${json['results'][0]['name']}');
    return json['results'];
  }
}
