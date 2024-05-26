import 'package:mirror/core/weather/constants/weather_response_constants.dart';
import 'package:mirror/core/weather/models/location.dart';

class WeatherModel {
  final Location location;
  final Current current;
  final Forecast forecast;

  WeatherModel.none()
      : location = const Location.none(),
        current = Current.none(),
        forecast = Forecast.none();

  WeatherModel.fromJson({required Map<String, dynamic> json})
      : location = Location.fromLocation(
            json: json[WeatherResponseConstants.location]),
        current =
            Current.fromCurrent(json: json[WeatherResponseConstants.current]),
        forecast = Forecast.fromForecast(
            forecast: json[WeatherResponseConstants.forecast]);

  @override
  String toString() =>
      'location: ${location.toString()}, current: ${current.toString()}, forecast: ${forecast.toString()}';
}
