import 'dart:convert';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';
// const TOM_TOM_API_KEY = 'HRuz7wv7smEY6AIL4MHFURCcNkEKjyG3';

class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';

    // return 'http://api.tomtom.com/map/1/staticimage?key=$TOM_TOM_API_KEY&zoom=13&center=$latitude,$longitude&format=jpg&layer=basic&style=main&width=600&height=300&view=Unified&language=en-GB';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY";

    final response = await http.get(url);

    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
