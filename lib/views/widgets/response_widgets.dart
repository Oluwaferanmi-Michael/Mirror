import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/helpers/constants/constants.dart';

class ResponseWidgets extends HookConsumerWidget {
  const ResponseWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Opacity(
        opacity: .6,
        child: CircleAvatar(
          child: Text('AI'),
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      Flexible(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: BoxDecoration(
            color: const Color.fromARGB(60, 255, 255, 255),
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
              child: Text(AppConstants.testText,
                  softWrap: true,
                  style: GoogleFonts.roboto(
                    shadows: [
                      const Shadow(
                          color: Color(0xFF161616),
                          offset: Offset(0, 1),
                          blurRadius: .5),
                    ],
                    color: Colors.white,
                    fontSize: 12,
                  ))),
        ),
      )
    ]);
  }
}
