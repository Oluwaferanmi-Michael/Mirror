
import 'dart:collection';

import 'package:mirror/core/AI/models/ai_function_call_model/constants/constants.dart';

class FunctionParameters extends MapView<String, dynamic>{
  FunctionParameters({
    required Map<String, dynamic> properties,
    List<String>? requiredParameters
    }) : super({
    ParameterKeys.type : ParameterKeys.typeValue,
    ParameterKeys.properties : properties,
    ParameterKeys.requiredParameters : requiredParameters
  });
}