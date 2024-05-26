// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:mirror/core/AI/providers/ai_response_provider.dart';

// class AiTestScreen extends ConsumerStatefulWidget {
//   const AiTestScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AiTestScreenState();
// }

// class _AiTestScreenState extends ConsumerState<AiTestScreen> {
//   late final TextEditingController controller;

//   @override
//   void initState() {
//     controller = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final aiRequest = ref.watch(aiRequestProvider.notifier);
//     final aiState = ref.watch(aiRequestProvider);
//     return Scaffold(
//         body: Center(
//       child: SizedBox(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         TextField(
//           controller: controller,
//         ),
//         TextButton(
//             onPressed: () {
//               aiRequest.aiResponseUpdateState(controller.text);
//             },
//             child: const Text('test button')),
        
//       ])),
//     ));
//   }
// }
