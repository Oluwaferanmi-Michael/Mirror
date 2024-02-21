
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


class PermissionsModel {
  final LocationPermission? locationPermission;
  final bool? cameraPermission;
  

  const PermissionsModel({this.locationPermission, this.cameraPermission});


  PermissionsModel copyWith({
    LocationPermission? locationPermission,
    bool? cameraPermission
    }) => 
    PermissionsModel(
      locationPermission: locationPermission ?? this.locationPermission,
      cameraPermission: cameraPermission ?? this.cameraPermission
      );

  // Default/Unknown permissions
  const PermissionsModel.unknown() : locationPermission = LocationPermission.unableToDetermine, cameraPermission = false;
}