import 'package:geolocator/geolocator.dart';
import 'package:mirror/core/services/permissions/location/location_permission.dart';

class LocationService {
  LocationService();

  final permit = LocationPermit();

  Future<Position> getUserLocation() async {
    final permission = await permit.currentPermission();

    if (permission == LocationPermission.denied) {
      await permit.askPermission();
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
  }
}
