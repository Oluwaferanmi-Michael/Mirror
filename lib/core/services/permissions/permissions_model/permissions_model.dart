
import 'package:geolocator/geolocator.dart';

class PermissionsModel {
  final LocationPermission? locationPermission;

  const PermissionsModel({this.locationPermission});


  PermissionsModel copyWith({
    LocationPermission? locationPermission
    }) => 
    PermissionsModel(
      locationPermission: locationPermission ?? this.locationPermission
      );

  // Default/Unknown permissions
  const PermissionsModel.unknown() : locationPermission = LocationPermission.unableToDetermine;
}