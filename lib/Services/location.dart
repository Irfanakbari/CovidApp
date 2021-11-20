import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  static Future<Placemark>? getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks[0].administrativeArea);
    return placemarks[0];
  }
}
