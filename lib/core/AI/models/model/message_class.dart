import '../../../weather/models/weather_model.dart';
import '../../constants/message_keys.dart';
import '../../constants/response_keys.dart';

class MessageClass {
  final MessageType messageType;
  final String? content;
  final WeatherModel? weatherDetails;

  const MessageClass(
      {required this.messageType, this.content, this.weatherDetails});

  MessageClass.unknown()
      : messageType = MessageType.none,
        content = 'Content.none()',
        // AiResponse.none(),
        weatherDetails = WeatherModel.none();

  MessageClass copyWith({content, weatherDetails}) => MessageClass(
        messageType: messageType,
        content: content ?? this.content,
        weatherDetails: weatherDetails ?? this.weatherDetails,
      );

  MessageClass.fromJson({required Map<String, dynamic> json})
      : messageType = json[MessageKeys.messageType],
        content = json[MessageKeys.content],
        weatherDetails = json[MessageKeys.weatherDetails];

  // overrides
  @override
  String toString() =>
      'MessageClass: ${messageType.name}, content: $content, weatherDetails $weatherDetails';

  @override
  int get hashCode => Object.hashAll([messageType, content, weatherDetails]);

  @override
  bool operator ==(covariant MessageClass other) =>
      messageType == other.messageType &&
      content == other.content &&
      weatherDetails == other.weatherDetails;
}

class Content {
  List<String> images;
  List<String> links;
  String content;

  Content.fromJson(Map<String, dynamic> aiContent)
      : images = aiContent[AiResponseKeys.images],
        content = aiContent[AiResponseKeys.content],
        links = aiContent[AiResponseKeys.links];

  Content.none()
      : images = [],
        content = '',
        links = [];

  @override
  String toString() => 'images: $images, content: $content, links: $links, ';
}

enum MessageType { weatherForecast, aiResponse, none }
