import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mirror/core/AI/constants/constants.dart';
import 'package:mirror/core/AI/models/open_ai_request_headers.dart';

class AiApi {
  const AiApi();

  Future<dynamic> functionCallingApi({
    required Map<String, dynamic> body,
  }) async {
    final url = Uri.https(
      Constants.baseUrl,
    );

    final headers = RequestHeaders();

    final requestBody = json.encode(body);

    final request = await http.post(
      url,
      headers: headers,
      body: requestBody,
    );
  }
}
