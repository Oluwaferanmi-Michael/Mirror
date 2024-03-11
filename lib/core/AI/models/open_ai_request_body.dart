import 'dart:collection';

class RequestBody extends MapView<String, dynamic> {
  RequestBody() : super({
    "model": "gpt-3.5-turbo",
    "messages": [{"role": "user", "content": "Say this is a test!"}],
    "temperature": 0.7
  });
}
