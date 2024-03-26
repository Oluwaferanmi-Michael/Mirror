import 'dart:collection';

import 'package:mirror/core/AI/models/ai_function_call_model/constants/constants.dart';

class AiFunction extends MapView<String, dynamic> {
  AiFunction({
    required Map<String, dynamic> toolFunction
  }) : super({
    FunctionKeys.type: 'function',
    FunctionKeys.function: toolFunction,
  });
}

class ToolFunction extends MapView<String, dynamic> {
  ToolFunction({
    required String name,
    required String description,
    String? parameters
  }) : super({
    FunctionKeys.name: name,
    FunctionKeys.description: description,
    FunctionKeys.parameters: parameters
  });
}