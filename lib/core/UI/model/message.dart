

import 'package:mirror/helpers/types/types.dart';

import '../../weather/models/weather_model.dart';

class MessagesTypes {
  final MessageType messageType;
  final AiTextResponse? content;
  final WeatherModel? weatherDetails;
  

  const MessagesTypes({required this.messageType, this.content, this.weatherDetails});

  MessagesTypes.unknown() : messageType = MessageType.none, content = {}, weatherDetails = const WeatherModel.none();

  MessagesTypes copyWith({
    content,
    weatherDetails}) => MessagesTypes(
      messageType: messageType,
      content: content ?? this.content,
      weatherDetails: weatherDetails ?? this.content,
      );
}

enum MessageType { weatherForecast, aiResponse, none }
