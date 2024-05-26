import 'package:mirror/core/AI/constants/response_keys.dart';
import 'package:mirror/core/AI/models/ai_message_models/ai_message_response.dart';
import 'package:mirror/helpers/logger.dart';

class AiResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<AiChoiceResponse> choices;

  final Map<String, dynamic> usage;

  AiResponse.none()
      : id = '',
        object = '',
        created = 0,
        model = '',
        choices = [],
        usage = {};

  AiResponse.fromJson({required Map<String, dynamic> json})
      : id = json[AiResponseKeys.id],
        object = json[AiResponseKeys.object],
        created = json[AiResponseKeys.created],
        model = json[AiResponseKeys.model],
        choices = (json[AiResponseKeys.choices] as List<dynamic>).map((choice) {
          '$choice'.log('AiResponse.json choice log');
          
          return AiChoiceResponse.fromChoice(choice: choice);
        }).whereType<AiChoiceResponse>().toList(),
        usage = json[AiResponseKeys.usage];

  @override
  int get hashCode => Object.hashAll([
        id,
        object,
        created,
        choices,
        usage,
      ]);

  @override
  bool operator ==(covariant AiResponse other) =>
      identical(this, other) ||
      (id == other.id &&
          object == other.object &&
          created == other.created &&
          choices == other.choices &&
          usage == other.usage);

  @override
  String toString() =>
      'id: $id /n object: $object created: $created /n choices: $choices /n usage: $usage';
}
