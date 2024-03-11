import 'dart:collection';

import 'package:mirror/core/AI/constants/constants.dart';
import 'package:mirror/core/AI/constants/request_keys.dart';
import 'package:mirror/core/AI/models/message_model.dart';

class AiRequestModel extends MapView<String, dynamic>{
  AiRequestModel({
    required List<Message> message,
    List<Object>? tools,
    String? toolChoice = 'auto',
  }) : super({
    BodyRequestKey.model : Constants.gpt35Turbo,
    BodyRequestKey.message : message,
    BodyRequestKey.tools : tools,
    BodyRequestKey.toolChoice : toolChoice
  });
}
