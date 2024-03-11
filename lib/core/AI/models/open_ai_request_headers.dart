import 'dart:collection';

import 'package:mirror/env/env.dart';

class RequestHeaders extends MapView<String, String> {
  RequestHeaders()
      : super({
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Env.openAiApiKey}'
        });
}
