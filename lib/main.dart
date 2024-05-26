import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/views/message_list_test_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(permissionsProvider.notifier).askLocationPermission();

    return const MaterialApp(
        home:
            // Scaffold(body: WeatherResponseWidget())
            MessageListView());
  }
}
