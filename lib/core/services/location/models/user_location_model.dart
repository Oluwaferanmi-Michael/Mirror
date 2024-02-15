
class UserLocation{
  
  final double? longitude;
  final double? latitude;

  const UserLocation({
    required this.longitude,
    required this.latitude
    });

  const UserLocation.unknown() : this(longitude: null, latitude: null);

  @override
  String toString() => '$latitude,$longitude';
}