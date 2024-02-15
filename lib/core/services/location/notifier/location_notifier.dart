

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../location.dart';
import '../models/user_location_model.dart';

class LocationStateNotifier extends StateNotifier<UserLocation> {
  LocationStateNotifier(): super(const UserLocation.unknown());

  final _location = LocationService();

  Future<void> getUserLocation() async {

    try{
      final location = await _location.getUserLocation();
    
      final userLocation = UserLocation(longitude: location.longitude, latitude: location.latitude);

      state = userLocation;
    } catch (e) {
      print(e.toString());
    }

    
  }
  
}