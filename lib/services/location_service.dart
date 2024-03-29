import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationService {
  static Position? currentPosition;
  static late String? _currentAddress;

  static Future<LatLng> getCurrentLocation() async =>
      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: false,
      ).then((Position position) {
        currentPosition = position;
        return LatLng(position.latitude, position.longitude);
      }).catchError((e) {
        print(e);
      });

  static Future<String?> getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);

      Placemark place = placemarks[0];

      _currentAddress =
          "${place.locality}, ${place.postalCode}, ${place.country}";
      return _currentAddress;
    } catch (e) {
      print(e);
    }
  }
}
