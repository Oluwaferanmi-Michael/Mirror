import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mirror/core/AI/constants/constants.dart';
import 'package:mirror/core/AI/models/open_ai_request_headers.dart';
import 'package:mirror/helpers/logger.dart';

class AiApi {
  const AiApi();

  Future<dynamic> functionCallingApi({
    required Map<String, dynamic> body,
  }) async {
    final url = Uri.https(Constants.baseUrl, Constants.chatCompletions);

    final headers = RequestHeaders();

    body.log('this is the body to be sent:');

    final requestBody = json.encode(body);

    final response = await http.post(
      url,
      headers: headers,
      body: requestBody,
    );

    final ai = json.decode(response.body);

    ai;

    return ai;
  }
}
