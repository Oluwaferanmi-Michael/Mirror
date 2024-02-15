import 'package:geolocator/geolocator.dart';

class LocationPermit{
  LocationPermit();


  Future<LocationPermission> askPermission() async {
    final permit = await Geolocator.requestPermission();
    return permit;
  }

  Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  Future<LocationPermission> currentPermission() async {
    return await Geolocator.checkPermission();
  }

}