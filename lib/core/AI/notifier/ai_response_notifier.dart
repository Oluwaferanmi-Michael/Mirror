import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/AI/models/ai_function_call_model/function.dart';
import 'package:mirror/core/AI/models/ai_response.dart';
import 'package:mirror/core/AI/models/message_model.dart';
import 'package:mirror/core/AI/models/notifier_state.dart';
import 'package:mirror/helpers/logger.dart';

import '../backend/ai_api.dart';
import '../models/ai_request_model.dart';

class AiResponseNotifier extends StateNotifier<AiNotifierState> {
  AiResponseNotifier() : super(AiNotifierState.empty);

  void get future => state;

  final _apiService = const AiApi();

  final tools = [
    AiFunction(
        toolFunction: ToolFunction(
          name: 'weatherForecast',
          description: 'Describes the weather forcast for the specified period'
        ))
  ];

  Future<AiResponse> _apiFunction({required String userRequest}) async {
    final message = [
      Message.systemMessage(
          content:
              'when you are not calling a function always return your message content as an object with the following fields that can be null: img, links, text'),
      Message.userMessage(content: userRequest),
    ];

    final body = AiRequestModel(message: message, tools: tools);

    final aiCall = await _apiService.functionCallingApi(body: body);

    return AiResponse.fromJson(json: aiCall);
  }

  Future<void> aiResponseUpdateState(String userRequest) async {
    final response = await _apiFunction(userRequest: userRequest);

    response.log();

    final aiResponse = response.choices.first.message;

    if (aiResponse.toolCalls!.isNotEmpty) {
      state = AiNotifierState.weatherForecast;
    }

    state = AiNotifierState.regularResponse;
  }
}
