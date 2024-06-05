import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/helpers/constants/constants.dart';
// import 'package:mirror/helpers/extensions/extensions.dart';

class AiResponseWidgets extends HookConsumerWidget {
  const AiResponseWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Opacity(
        opacity: .6,
        child: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(
              'm',
              textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false),
              style:
                  GoogleFonts.courierPrime(color: Colors.white, fontSize: 24),
            )),
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
                          blurRadius: 0),
                    ],
                    color: Colors.white,
                    fontSize: 12,
                  ))),
        ),
      )
    ]);
  }
}