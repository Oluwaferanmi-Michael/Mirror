import '../helpers/notifier_state.dart';
import 'ai_message_models/ai_message_response.dart';

class AiToolFunctionResponseState {
  final AiNotifierState aiNotifierState;
  final FunctionResponse? functionDetails;
  final ChoiceMessage? aiContent;

  AiToolFunctionResponseState(
      {required this.aiNotifierState, this.functionDetails, this.aiContent});

  @override
  String toString() => 'aiNotifierState: $aiNotifierState, functionDetails: $functionDetails, aiContent: $aiContent';

  @override
  int get hashCode => Object.hashAll([aiNotifierState, functionDetails]);

  @override
  bool operator ==(covariant AiToolFunctionResponseState other) =>
      identical(this, other) ||
      aiNotifierState == other.aiNotifierState &&
          functionDetails == other.functionDetails;
}
