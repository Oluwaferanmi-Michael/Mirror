import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/AI/notifier/function_call_notifier.dart';
import 'package:mirror/core/UI/model/message.dart';

final functionCallProvider = StateNotifierProvider<FunctionCallNotifier, MessagesTypes>((ref) => FunctionCallNotifier());
