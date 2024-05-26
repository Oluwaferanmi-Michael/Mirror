import 'package:mirror/core/weather/constants/weather_query_keys.dart';

class WeatherQueryParam{
  final String query;
  String? days;
  final String apiKey;

  // @override
  // String toString() => '$values';

  WeatherQueryParam({required this.query, required this.apiKey,});

  static Map<String, dynamic> toJson({
    required String query,
    String? days,
    required String apiKey
    }) => {
          WeatherQueryKeys.query: query,
          WeatherQueryKeys.duration: days ?? '7',
          WeatherQueryKeys.key: apiKey,
        };

  WeatherQueryParam.fromJson(
      {required Map<String, dynamic> json, required String key})
      : query = json[WeatherQueryKeys.query],
        days = json[WeatherQueryKeys.duration] ?? '7',
        apiKey = key;
        
}