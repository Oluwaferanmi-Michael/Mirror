import 'package:mirror/env/env.dart';

import '../../services/location/location.dart';
import '../../services/location/models/user_location_model.dart';
import '../../weather/models/weather_model.dart';
import '../../weather/backend/weather_api.dart';
import '../../weather/models/weather_query_param_model.dart';

class FunctionsCalled {
  final _weatherApi = const WeatherApi();

  Future<WeatherModel> weatherForecast(LocationService locationService) async {
    final loc = await locationService.getUserLocation();
    final location =
        UserLocation(longitude: loc.longitude, latitude: loc.latitude)
            .toString();
    final params =
        WeatherQueryParam(query: location, apiKey: Env.weatherApiKey);
    final weather = await _weatherApi.forecastCall(params: params);

    return weather;
  }
}
