import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mirror/core/weather/constants/constants.dart';


class WeatherApi {
  const WeatherApi();

  Future<dynamic> forecastCall({
    required String position,
  }) async {
    // final url = Uri.https('www.google.com');

    final url = Uri.https(
      WeatherConstants.baseUrl,
      WeatherConstants.forcastUrl,
      {'q' : position, 'days' : '7', 'key': WeatherConstants.apiKey}
    );

    try{
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        default:
          return 'callFailed';
      }
    } on SocketException catch (e) {
      print(e.message);     
    } catch (e) {
      print(e);
    }
  }

}
