import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/weather/models/weather_model.dart';
import '../notifier/weather_notifier.dart';


final weatherProvider = StateNotifierProvider<WeatherNotifier, WeatherModel>((ref) => WeatherNotifier());