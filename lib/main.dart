import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:mirror/core/services/permissions/permissions_provider/permissions_provider.dart';
import 'package:mirror/views/test_views/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref)  {
    
    // ref.watch(permissionsProvider.notifier).askLocationPermission();

    return const MaterialApp(
      home: TestView()
    );
  }
}
