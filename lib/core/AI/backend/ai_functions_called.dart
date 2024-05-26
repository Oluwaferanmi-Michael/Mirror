import 'package:mirror/core/AI/backend/ai_api.dart';
import 'package:mirror/core/AI/helpers/ai_helpers.dart';
import 'package:mirror/core/AI/models/ai_request_model.dart';
import 'package:mirror/core/AI/models/message_model.dart';
import 'package:mirror/env/env.dart';

import '../../services/location/location.dart';
import '../../services/location/models/user_location_model.dart';

import '../../weather/backend/weather_api.dart';
import '../../weather/models/weather_query_param_model.dart';

class FunctionsCalled {
  final _weatherApi = const WeatherApi();
  final _aiApi = const AiApi();

  Future<dynamic> weatherForecast(LocationService locationService) async {
    final loc = await locationService.getUserLocation();
    final location =
        UserLocation(longitude: loc.longitude, latitude: loc.latitude)
            .toString();
    final params =
        WeatherQueryParam.toJson(query: location, apiKey: Env.weatherApiKey);
    final weather = await _weatherApi.forecastCall(params: params);

    return weather;
  }

  Future<dynamic> aiContent({required String content}) async {
    final aiResponse = await _aiApi.functionCallingApi(
        body: AiRequestModel(message: [
      ...AiHelpers.aiMessages,
      Message.userMessage(content: content)
    ]));

    return aiResponse;
  }
}
