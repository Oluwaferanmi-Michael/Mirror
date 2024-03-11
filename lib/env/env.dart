import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'weatherApiKey', obfuscate: true)
  static final String weatherApiKey = _Env.weatherApiKey;

  @EnviedField(varName: 'openAiApiKey', obfuscate: true)
  static final String openAiApiKey = _Env.openAiApiKey;
}
