import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/services/permissions/permissions_provider/permissions_provider.dart';
import '../../core/weather/providers/weather_provider.dart';


class TestView extends ConsumerWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final weather = ref.watch(weatherProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Weather:'),
            Text(weather)
          ],
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.pin_drop_rounded),
        onPressed: () async {

          final locationPermissionNotifier = ref.watch(permissionsProvider.notifier);
          final checkPermission = await locationPermissionNotifier.getCurrentPermission();

          if (checkPermission == false){
            await locationPermissionNotifier.askLocationPermission()
            .then((v) async {
              if (v == true) {
                await ref.watch(weatherProvider.notifier).weatherForecast();
              }
            });
          }

          await ref.watch(weatherProvider.notifier).weatherForecast();

        },
      ),
    );
  }
}