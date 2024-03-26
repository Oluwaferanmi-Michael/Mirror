import 'dart:collection';

import 'package:mirror/core/AI/constants/message_keys.dart';
import 'package:mirror/core/AI/helpers/enum.dart';

class Message extends MapView<String, dynamic> {
  String? content;
  String? name;
  String? toolCallId;
  List<dynamic>? toolCalls;

  Message.userMessage({required this.content})
      : super(
            {MessageKeys.role: Roles.user.name, MessageKeys.content: content});

  Message.assistantMessage({required this.content, this.toolCalls})
      : super({
          MessageKeys.role: Roles.assistant.name,
          MessageKeys.content: content,
          MessageKeys.toolCalls: toolCalls
        });

  Message.systemMessage({required this.content})
      : super({
          MessageKeys.role: Roles.system.name,
          MessageKeys.content: content,
        });

  Message.toolMessage({
    required this.content,
    required this.toolCallId,
  }) : super({
          MessageKeys.role: Roles.tool.name,
          MessageKeys.content: content,
          MessageKeys.name: toolCallId,
        });
}
