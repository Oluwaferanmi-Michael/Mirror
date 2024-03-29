import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/AI/helpers/notifier_state.dart';
import 'package:mirror/core/AI/notifier/ai_response_notifier.dart';

final aiRequestProvider = StateNotifierProvider<AiResponseNotifier, AiNotifierState>((ref) {
  return AiResponseNotifier();
});
