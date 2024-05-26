
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:mirror/core/AI/helpers/notifier_state.dart';
import 'package:mirror/helpers/logger.dart';

import '../../weather/controller/weather_controler.dart';
import '../controller/ai_controller.dart';
import '../models/model/message_class.dart';

class AiRequestNotifier extends StateNotifier<List<MessageClass>> {
  AiRequestNotifier() : super([]);

  late final _aiService = AIController();
  late final weatherService = WeatherController();

  final tools = [AiNotifierState.weatherForecast.name];

  Future<void> callNotifier(String userRequest) async {
    final aiState = await _aiService.aiResponseUpdateState(userRequest);
    for (final response in aiState) {

      if (response.functionDetails?.name ==
          AiNotifierState.weatherForecast.name) {
        final weatherDetails = await weatherService.weatherForecast();
        final message = MessageClass(
            messageType: MessageType.weatherForecast,
            weatherDetails: weatherDetails);
        message.log();
        state.add(message);
      } else {
        final aiContent = response.aiContent?.content ?? 'Content.none()';
        aiContent.log('Plain text returned by AI');
        final message = MessageClass(
            messageType: MessageType.aiResponse,
            content: aiContent);
        message.log();
        state.add(message);
      }
    }
  }
}
