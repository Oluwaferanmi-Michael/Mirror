import 'package:mirror/core/AI/constants/response_keys.dart';

class AiChoiceResponse {
  final int index;
  final ChoiceMessage message;
  final String finishReason;
  final String? logProbs;

  AiChoiceResponse.fromChoice({
    required Map<String, dynamic> choice,
  })  : index = choice[AiResponseKeys.index],
        message = ChoiceMessage.fromJson(
            messageToolsCalls: choice[AiResponseKeys.message]),
        logProbs = choice[AiResponseKeys.logProbs],
        finishReason = choice[AiResponseKeys.finishReason];
}

class FunctionResponse {
  final String name;
  final Map<String, dynamic> arguments;

  FunctionResponse.fromFunction({required Map<String, dynamic> function})
      : name = function[AiResponseKeys.name],
        arguments = function[AiResponseKeys.arguments];
}

class ToolCalls {
  final String id;
  final String type;
  final FunctionResponse function;

  ToolCalls.fromTools({required Map<String, dynamic> tool})
      : id = tool[AiResponseKeys.id],
        type = tool[AiResponseKeys.type],
        function = tool[AiResponseKeys.function]
            .map((data) => FunctionResponse.fromFunction(function: data));
}

class ChoiceMessage {
  List<ToolCalls>? toolCalls;

  ChoiceMessage.fromJson({Map<String, dynamic>? messageToolsCalls})
      : toolCalls = (messageToolsCalls?[AiResponseKeys.toolCalls] as List)
            .map((tool) => ToolCalls.fromTools(tool: tool))
            .toList();
}
