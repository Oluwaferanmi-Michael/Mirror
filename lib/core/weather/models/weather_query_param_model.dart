import 'dart:collection';

import 'package:mirror/core/weather/constants/weather_query_keys.dart';


class WeatherQueryParam extends MapView<String, dynamic>{

  @override
  String toString() => '$values';

  WeatherQueryParam({
    required String query,
    String? days,
    required String apiKey
    }) : super({
        WeatherQueryKeys.query: query,
        WeatherQueryKeys.duration: days ??= '7',
        WeatherQueryKeys.key : apiKey,
      });
}