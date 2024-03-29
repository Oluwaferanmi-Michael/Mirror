import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/UI/model/message.dart';

class FunctionCallNotifier extends StateNotifier<MessagesTypes> {
  FunctionCallNotifier() : super(MessagesTypes.unknown());


}
