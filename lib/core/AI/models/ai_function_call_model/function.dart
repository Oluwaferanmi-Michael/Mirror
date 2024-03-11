import 'dart:collection';

import 'package:mirror/core/AI/models/ai_function_call_model/constants/constants.dart';

class AiFunction extends MapView<String, dynamic> {
  AiFunction({
    required String functionName,
    String? description,
    Map<String, dynamic>? parameters
  }) : super({
    FunctionKeys.name : functionName,
    FunctionKeys.description: description,
    FunctionKeys.parameters: parameters
  });
}
