import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/services/location/models/user_location_model.dart';

import 'package:mirror/core/weather/models/weather_query_param_model.dart';
import 'package:mirror/env/env.dart';


import '../../services/location/location.dart';
import '../controller/weather_controler.dart';
import '../models/weather_model.dart';

class WeatherNotifier extends StateNotifier<WeatherModel> {
  WeatherNotifier() : super(WeatherModel.none());

  final _weather = WeatherController();

  Future<void> weatherForecast() async {
    final weather = await _weather.weatherForecast();
    state = weather;
  }
}
