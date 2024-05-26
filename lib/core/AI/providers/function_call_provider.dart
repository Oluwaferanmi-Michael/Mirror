import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/AI/models/model/message_class.dart';
import 'package:mirror/core/AI/providers/ai_response_provider.dart';

// import '../notifier/message_class_state_notifier.dart';

// import '../models/ai_message_models/ai_message_response.dart';

// final addMessagesProvider = StateNotifierProvider.autoDispose
//     .family<MessageClassStateNotifier, Iterable<MessageClass>, String>(
//         (ref, String u) {
//   return MessageClassStateNotifier();
// });

final callFunctionProvider =
    StreamProvider.autoDispose<Iterable<MessageClass>>((ref) {
  final controller = StreamController<Iterable<MessageClass>>();

  final message = ref.watch(aiRequestProvider);

  controller.sink.add(message);

  ref.onDispose(() {
    controller.close();
    // sub.cancel();
  });

  return controller.stream;
});
