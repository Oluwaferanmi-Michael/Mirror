import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../notifier/weather_notifier.dart';


final weatherProvider = StateNotifierProvider<WeatherNotifier, String>((ref) => WeatherNotifier());