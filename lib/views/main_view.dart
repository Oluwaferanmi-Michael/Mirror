import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/views/test_views/test_view_3.dart';
import 'package:mirror/views/widgets/time_widget.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    

    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        alignment: Alignment.center,
          children: [
            TestView3(),

            Positioned(
              bottom: 10,
              child: TimeDateWidget(),
              ),
            
          ],
        ),
    );
  }
}