
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/services/permissions/location/location_permission.dart';
import 'package:mirror/core/services/permissions/camera/camera_permission.dart';
import 'package:mirror/core/services/permissions/permissions_model/permissions_model.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsNotifier extends StateNotifier<PermissionsModel>{
  PermissionsNotifier() : super(const PermissionsModel.unknown());

  final _locationPermission = LocationPermit();
  final _cameraPermission = const CameraPermit();

  Future<bool> askLocationPermission() async {
    try {
      final status = await _locationPermission.askPermission();

      state = state.copyWith(locationPermission: status);

      return await _locationpermissionCase(status);
    } catch (e) {
      print(e.toString());
      return false;

    }

  }

  Future<bool> getCurrentLocationPermission() async {
    final currentPermission = await _locationPermission.currentPermission();

    return _locationpermissionCase(currentPermission);
  }


  Future<bool> askCameraPermission() async {

    final permit = await _cameraPermission.requestCameraPermission();

    final permission = await _cameraPermissionCase(permit);

    state.copyWith(cameraPermission: permission);

    return permission;

  }


// Handle true or false on camera [LocationPermission]
  Future<bool> _locationpermissionCase(LocationPermission permit) async {
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


// Handle true or false on camera [PermissionStatus]
  Future<bool> _cameraPermissionCase(PermissionStatus permit) async {
    switch (permit) {
      case PermissionStatus.granted:
        return true;
      case PermissionStatus.denied:      
        return false;
      case PermissionStatus.restricted:
        return false;
      case PermissionStatus.limited:
        return false;
      case PermissionStatus.permanentlyDenied:
        return false;
        case PermissionStatus.provisional:
        return true;
    }
  }
  
}