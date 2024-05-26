import 'package:mirror/core/AI/models/ai_message_models/ai_message_response.dart';
import 'package:mirror/core/AI/models/ai_response.dart';

import 'package:mirror/core/weather/models/weather_query_param_model.dart';
import 'package:mirror/env/env.dart';

class ToolRequestArguments {
  Map<String, dynamic>? weatherQuery;
  ChoiceMessage? aiContent;

  ToolRequestArguments();

  ToolRequestArguments.fromjson({required FunctionResponse json})
      : weatherQuery = WeatherQueryParam.toJson(
            query: json.arguments?.query ?? '',
            days: json.arguments?.days ?? '',
            apiKey: Env.weatherApiKey);

  ToolRequestArguments.fromResult({required AiResponse result})
      : aiContent = ChoiceMessage.fromJson(messageToolCalls: result.choices.first as Map<String, dynamic>);
}
