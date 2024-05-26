import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/helpers/constants/constants.dart';
import 'package:mirror/helpers/extensions/extensions.dart';
import 'package:mirror/views/widgets/response_widgets/ai_response_widgets.dart';
import 'package:mirror/views/widgets/time_widget.dart';

class TestView2 extends ConsumerStatefulWidget {
  const TestView2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestView2State();
}

class _TestView2State extends ConsumerState<TestView2> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppConstants.testScreenImage.imgAsset()),
          Container(
            width: mediaSize.width,
            height: mediaSize.height,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 24),
                      // color: Colors.purpleAccent,
                      child: const SafeArea(child: AiResponseWidgets()),
                    )),
                Opacity(
                    opacity: .6,
                    child: GestureDetector(
                      onLongPressDown: (details) {},
                      child: Container(height: 130),
                    ))
              ],
            ),
          ),
          const Positioned(bottom: 100, child: TimeDateWidget())
        ],
      ),
    );
  }
}
