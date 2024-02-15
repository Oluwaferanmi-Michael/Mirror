
import 'package:mirror/env/env.dart';

class WeatherConstants{
  const WeatherConstants._();

  static const baseUrl = 'api.weatherapi.com';
  static const forcastUrl = '/v1/forecast.json';
  static const realtimeUrl = '/v1/current.json';

  static final apiKey = Env.weatherApiKey;

  
  
}