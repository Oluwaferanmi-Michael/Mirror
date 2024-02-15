

import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/services/permissions/location/location_permission.dart';
import 'package:mirror/core/services/permissions/permissions_model/permissions_model.dart';

class PermissionsNotifier extends StateNotifier<PermissionsModel>{
  PermissionsNotifier() : super(const PermissionsModel.unknown());

  final _locationPermission = LocationPermit();

  Future<bool> askLocationPermission() async {
    try {
      final status = await _locationPermission.askPermission();

      state = state.copyWith(locationPermission: status);

      return await _permissionCase(status);
    } catch (e) {
      print(e.toString());
      return false;

    }

  }

  Future<bool> getCurrentPermission() async {
    final currentPermission = await _locationPermission.currentPermission();

    return _permissionCase(currentPermission);
  }

  Future<bool> _permissionCase(LocationPermission permit) async {
    switch (permit) {
      case LocationPermission.always:
        return true;
      case LocationPermission.whileInUse:
        return true;
      case LocationPermission.denied:
        return false;
      case LocationPermission.unableToDetermine:
        return false;
      case LocationPermission.deniedForever:
        _locationPermission.openLocationSettings();
        return false;
    }
  }
  
}