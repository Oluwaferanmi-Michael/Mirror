import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timer_builder/timer_builder.dart';

class TimeDateWidget extends ConsumerWidget {
  const TimeDateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TimerBuilder.periodic(const Duration(seconds: 1),
        builder: (context) {
      return Text(DateTime.now().toString().substring(11, 16),
          style: GoogleFonts.courierPrime(       
              textStyle: const TextStyle(
            letterSpacing: -14,
            color: Color(0xFFDADADA),
            fontSize: 64,
          )));
    });
  }
}
