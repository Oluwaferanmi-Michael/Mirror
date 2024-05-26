import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/AI/providers/ai_response_provider.dart';
import 'package:mirror/core/AI/providers/function_call_provider.dart';

class MessageListView extends HookConsumerWidget {
  const MessageListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    final messages = ref.watch(callFunctionProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: messages.when(data: (data) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final e = data.elementAt(index);

                  return Container(
                      color: Colors.black26,
                      child: Column(children: [
                        Text(e.messageType.toString()),
                        Text(e.content.toString()),
                        Text(e.weatherDetails.toString()),
                        Text('$index',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 24)
                      ]));
                },
                itemCount: data.length,
              );
            }, error: (error, stackTrace) {
              return Text('error, $error \n stackTrace: $stackTrace');
            }, loading: () {
              return const CircularProgressIndicator.adaptive();
            })),
            SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: textController,
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        final notifier = ref.watch(aiRequestProvider.notifier);
                        await notifier.callNotifier(textController.text);

                        textController.clear();
                      },
                      icon: const Icon(Icons.send_outlined))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
