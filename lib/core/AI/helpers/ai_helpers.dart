import 'package:mirror/core/AI/models/model/message_class.dart';

import '../models/ai_function_call_model/function.dart';
import '../models/message_model.dart';

class AiHelpers {
  static final aiTools = 
  [
    AiFunction(
        toolFunction: ToolFunction(
            name: MessageType.weatherForecast.name,
            description:
                'Describes the weather forcast for the specified location'))
    ];

  static final aiMessages = [
      Message.systemMessage(
          content:
              'when you are not calling a function always return your message content as an object with the following fields that can be null: img, links, text'), 
    ];
}
