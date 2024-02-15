import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/services/location/models/user_location_model.dart';
import '../backend/weather_api.dart';
import '../../services/location/location.dart';

class WeatherNotifier extends StateNotifier<String>{
  WeatherNotifier() : super('place String');

  final _weatherApi = const WeatherApi();
  final _location = LocationService();


  Future<void> weatherForecast() async {

    final position = await _location.getUserLocation();

    final location = UserLocation(latitude: position.latitude, longitude: position.longitude).toString();

    final value = await _weatherApi.forecastCall(position: location);

    state = '$value';
  }
}