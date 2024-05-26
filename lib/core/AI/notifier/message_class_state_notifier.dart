import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/AI/models/model/message_class.dart';

class MessageClassStateNotifier extends StateNotifier<Iterable<MessageClass>> {
  MessageClassStateNotifier() : super([]);

  @override
  String toString() => 'state: ${state.map((e) => e.toString())}';

  void addMessage(List<MessageClass> messages) {
    for (final item in messages) {
      state = [...state, item];
    }
  }
}
