// import 'dart:async';

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:mirror/core/AI/helpers/notifier_state.dart';
// import 'package:mirror/core/AI/models/ai_tool_function_response_model.dart';
// import 'package:mirror/core/AI/notifier/ai_notifier.dart';
// import 'package:mirror/core/AI/providers/ai_response_provider.dart';
// import 'package:mirror/core/weather/notifier/weather_notifier.dart';
// import 'package:mirror/core/weather/providers/weather_provider.dart';
// import 'package:mirror/helpers/logger.dart';

// import '../models/model/message_class.dart';
// import 'message_class_state_notifier.dart';

// class FunctionCallNotifier extends StateNotifier<Iterable<MessageClass>> {
//   final Provider weatherProvider;
//   final Provider<Iterable> aiProvider;
//   final WeatherNotifier weatherProviderNotifier;
//   final AiResponseNotifier aiNotifier;

//   FunctionCallNotifier(
//       {required this.aiProvider,
//       required this.weatherProvider,
//       required this.weatherProviderNotifier,
//       required this.aiNotifier})
//       : super([]);

//   List<MessageClass> messages = [];

//   Future<void> callNotifiers({required String userRequest}) async {
//     await aiNotifier.aiResponseUpdateState(userRequest);
//     for (final response in aiProvider) {
//       if (response.functionDetails?.name ==
//           AiNotifierState.weatherForecast.name) {
//         await weatherFunction.weatherForecast();
//         final message = MessageClass(
//             messageType: MessageType.weatherForecast,
//             weatherDetails: weatherDetails);
//         messages = [...messages, message];
//       } else {
//         final message = MessageClass(
//             messageType: MessageType.aiResponse,
//             content: response.aiContent?.content);
//         messages = [...messages, message];
//       }
//     }
//     messages.map((e) => e.toString().log());
//     return messages;
//   }

// //
// //   Future<void> _checkWhichFunction(
// //       {required AiNotifierState messageType,
// //       ToolRequestArguments? requestArguments,
// //       String? content}) async {
// //     if (messageType == AiNotifierState.weatherForecast) {
// //       final weatherDetails =
// //           await _aiFunctionsCalled.weatherForecast(_location);
// //       state = [
// //         ...state,
// //         MessageClass(
// //             messageType: MessageType.weatherForecast,
// //             weatherDetails: WeatherModel.fromJson(json: weatherDetails))
// //       ];
// //     } else {
// //       // final aiResponse =
// //       //     await _aiFunctionsCalled.aiContent(content: content ?? '');

// //       // final aiContent = AiResponse.fromJson(json: aiResponse);

// //       state = [
// //         ...state,
// //         MessageClass(messageType: MessageType.aiResponse, content: requestArguments?.aiContent?.content)
// //       ];
// //     }
// //   }

// // //
// //   Future<void> callFunction(
// //       List<AiNotifierState> message, {String? content, ToolRequestArguments? requestArgument}) async {
// //     for (final aiState in message) {
// //       _checkWhichFunction(messageType: aiState, content: content, requestArguments: requestArgument);
//   // }
// }
