import 'package:hooks_riverpod/hooks_riverpod.dart';



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
