import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/services/location/models/user_location_model.dart';

import 'package:mirror/core/weather/models/weather_query_param_model.dart';
import 'package:mirror/env/env.dart';

import '../backend/weather_api.dart';
import '../../services/location/location.dart';
import '../models/weather_model.dart';

class WeatherController{
  WeatherController();

  final _weatherApi = const WeatherApi();
  final _location = LocationService();

  Future<WeatherModel> weatherForecast() async {
    final position = await _location.getUserLocation();

    final location =
        UserLocation(latitude: position.latitude, longitude: position.longitude)
            .toString();

    final params =
        WeatherQueryParam.toJson(query: location, apiKey: Env.weatherApiKey);
    // print(params);

    final value = await _weatherApi.forecastCall(params: params);

    final forecast = WeatherModel.fromJson(json: value);

    return forecast;
  }
}
