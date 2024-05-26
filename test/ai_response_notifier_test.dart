import 'package:mirror/core/AI/helpers/notifier_state.dart';
import 'package:mirror/core/AI/notifier/ai_notifier.dart';
import 'package:test/test.dart';

void main() {
  group('AiResponseNotifierTest', () {
    final aiResponseNotifier = AiResponseNotifier();
    final initialState = aiResponseNotifier.state;
    test('Should Return a list of tools to use as its state', () async {
      await aiResponseNotifier.aiResponseUpdateState('Whats the weather like today');

      print(aiResponseNotifier.state);

      expect(aiResponseNotifier.state, [...initialState, AiNotifierState.weatherForecast]);
    });
  });
}
