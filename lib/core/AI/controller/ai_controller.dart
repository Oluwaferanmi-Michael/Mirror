import 'package:mirror/core/AI/backend/ai_api.dart';
import 'package:mirror/helpers/logger.dart';

import '../constants/response_keys.dart';
import '../helpers/ai_helpers.dart';
import '../helpers/notifier_state.dart';
import '../models/ai_request_model.dart';
import '../models/ai_response.dart';
import '../models/ai_tool_function_response_model.dart';
import '../models/message_model.dart';

class AIController {
  AIController();

  final _apiService = const AiApi();

  List<AiToolFunctionResponseState> toolFunctions = [];

  final tools = [AiNotifierState.weatherForecast.name];

  Future<AiResponse> _apiFunction({required String userRequest}) async {
    final message =
        // [
        //   ...AiHelpers.aiMessages,
        //   Message.userMessage(content: userRequest)
        // ];
        [
      Message.systemMessage(
        content:
            "You are an AI assistant integrated into an app via the API, designed to respond to user requests and questions and be helpful. If a request requires calling an inbuilt function but the necessary arguments are missing, ask for those arguments explicitly and then call the function. For any questions, requests, or prompts that lack sufficient context or details, always seek clarification before providing a response. Your responses should always be formatted as an object with three fields: 'images', 'content', and 'links'. The 'images' field is a List of image URLs, the 'links' field is a List of link URLs, and the 'content' field is a String formatted with appropriate escape characters for easy readability. For example: {images : [\"http://image1.jpg\", \"http://image2.jpg\"], content: \"This is the Model's text response\", links: [\"http://www.helpfullink1.com\", \"http://www.helpfullink2.com\"]}.  Now, respond to the following user request:",

        // 'when you are not calling a function always return your message content as an object with the following fields that can be null: img, links, text'
      ),
      Message.userMessage(content: userRequest),
    ];

    final body = AiRequestModel(message: message, tools: AiHelpers.aiTools);

    final aiCall = await _apiService.functionCallingApi(body: body);

    return AiResponse.fromJson(json: aiCall);
  }

  ///
  Future<List<AiToolFunctionResponseState>> aiResponseUpdateState(
      String userRequest) async {
    final response = await _apiFunction(userRequest: userRequest);

    response.log('AI Response');

    final aiResponseReason = response.choices.first.finishReason;
    final toolsCalled = response.choices.first.message.toolCalls;
    final choiceResponse = response.choices.first.message;

    /// if request finished because of a tool response update state to [AiNotifier.(desired tool)] return tool(function) arguments
    if (aiResponseReason == AiResponseKeys.toolCalls) {
      for (final tool in toolsCalled!) {
        if (tools.contains(tool.function.name)) {
          /// check if tool has such an enum
          final aiNotifierState =
              AiNotifierState.values.byName(tool.function.name);

          if (toolFunctions.isNotEmpty) {
            toolFunctions.log("Items in State List (controller)");
            toolFunctions.clear();
          }

          final aiState = AiToolFunctionResponseState(
              aiNotifierState: aiNotifierState, functionDetails: tool.function);

          /// populate List state with enum type

          toolFunctions.add(aiState);
        }
      }
      final result = toolFunctions;
      return result;
    } else {
      //
      if (toolFunctions.isNotEmpty) {
        toolFunctions.log("Items in State List (controller)");
        toolFunctions.clear();
      }

      final aiState = AiToolFunctionResponseState(
          aiNotifierState: AiNotifierState.regularResponse,
          aiContent: choiceResponse);

      toolFunctions.add(aiState);
      final result = toolFunctions;
      return result;
    }
    // if request finished to give regular response update state to [AiNotifier.regularResponse]
  }
}
