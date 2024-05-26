import 'dart:convert';

import 'package:mirror/core/AI/constants/response_keys.dart';
import 'package:mirror/core/AI/models/model/message_class.dart';
import 'package:mirror/core/weather/constants/weather_query_keys.dart';
import 'package:mirror/helpers/logger.dart';

class AiChoiceResponse {
  final int index;
  final ChoiceMessage message;
  final String finishReason;
  final String? logProbs;

  AiChoiceResponse.fromChoice({
    required Map<String, dynamic> choice,
  })  : index = choice[AiResponseKeys.index],
        message = ChoiceMessage.fromJson(
            messageToolCalls: choice[AiResponseKeys.message]),
        logProbs = choice[AiResponseKeys.logProbs],
        finishReason = choice[AiResponseKeys.finishReason];

  @override
  String toString() =>
      '$index, message: $message , logProbs: $logProbs, finishReason: $finishReason';
}

class FunctionResponse {
  final String name;
  final Arguments? arguments;

  FunctionResponse.fromFunction({required Map<String, dynamic> function})
      : name = function[AiResponseKeys.name],
        arguments = Arguments.fromJson(
            json: jsonDecode(function[AiResponseKeys.arguments]));
}

class ToolCalls {
  final String id;
  final String type;
  final FunctionResponse function;

  ToolCalls.fromTools({required Map<String, dynamic> tool})
      : id = tool[AiResponseKeys.id],
        type = tool[AiResponseKeys.type],
        function = FunctionResponse.fromFunction(
            function: tool[AiResponseKeys.function]);

  // (tool[AiResponseKeys.function] as Map<String, dynamic>)
  //     .map((data) => FunctionResponse.fromFunction(function: data));

  @override
  String toString() => 'id: $id, type: $type, function: $function,';
}

class ChoiceMessage {
  List<ToolCalls>? toolCalls;
  final String role;
  final String? content;

  ChoiceMessage.fromJson({required Map<String, dynamic> messageToolCalls})
      : toolCalls = messageToolCalls[AiResponseKeys.toolCalls] != null
            ? (messageToolCalls[AiResponseKeys.toolCalls] as List<dynamic>)
                .map((e) {
                  try {
                    return ToolCalls.fromTools(tool: e);
                  } on FormatException catch (err) {
                    err.log();
                    e.log();
                  }
                })
                .whereType<ToolCalls>()
                .toList()
            : [],
        role = messageToolCalls[AiResponseKeys.role],
        content = messageToolCalls[AiResponseKeys.content];
  // Content.fromJson(jsonDecode(messageToolCalls[AiResponseKeys.content]));

  @override
  String toString() => 'toolCalls: $toolCalls, role: $role, content: $content';
}

// class ResponseMessage {
//   final String role;
//   final String? content;

//   const ResponseMessage.none() : role = '', content = '';

//   ResponseMessage.fromMessage({required Map<String, dynamic> message})
//       : role = message[AiResponseKeys.role],
//         content = message[AiResponseKeys.message] ?? '';
// }

class Arguments {
  final String? query;
  final String? days;

  Arguments.fromJson({required Map<String, dynamic> json})
      : query = json[WeatherQueryKeys.query] ?? '',
        days = json[WeatherQueryKeys.duration] ?? '7';
}
