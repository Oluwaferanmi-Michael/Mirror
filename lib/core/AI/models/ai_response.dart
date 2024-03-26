import 'package:mirror/core/AI/constants/response_keys.dart';
import 'package:mirror/core/AI/models/ai_message_models/ai_message_response.dart';

class AiResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<AiChoiceResponse> choices;
  final String? logProbs;
  final String finishReason;
  final Map<String, dynamic> usage;

  AiResponse.fromJson({Map<String, dynamic>? json})
      : id = json?[AiResponseKeys.id],
        object = json?[AiResponseKeys.object],
        created = json?[AiResponseKeys.created],
        model = json?[AiResponseKeys.model],
        choices = (json?[AiResponseKeys.choices] as List)
            .map((choice) => AiChoiceResponse.fromChoice(choice: choice))
            .toList(),
        logProbs = json?[AiResponseKeys.logProbs],
        finishReason = json?[AiResponseKeys.finishReason],
        usage = json?[AiResponseKeys.usage];

  @override
  int get hashCode => Object.hashAll([
        id,
        object,
        created,
        choices,
        logProbs,
        finishReason,
        usage,
      ]);

  @override
  bool operator ==(covariant AiResponse other) =>
      identical(this, other) ||
      (id == other.id &&
          object == other.object &&
          created == other.created &&
          choices == other.choices &&
          logProbs == other.logProbs &&
          finishReason == other.finishReason &&
          usage == other.usage);
}
