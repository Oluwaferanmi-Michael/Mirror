import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService();


  Future<Position> getUserLocation() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
  }

}
