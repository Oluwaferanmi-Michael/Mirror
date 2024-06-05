

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mirror/core/AI/models/model/message_class.dart';
import 'package:mirror/core/AI/notifier/ai_notifier.dart';

final aiRequestProvider = StateNotifierProvider<AiRequestNotifier, List<MessageClass>>((ref) {
  
  return AiRequestNotifier();
});
