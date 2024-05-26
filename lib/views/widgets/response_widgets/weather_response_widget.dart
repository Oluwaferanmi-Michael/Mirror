import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/weather/models/weather_model.dart';
import 'package:mirror/helpers/extensions/extensions.dart';

import '../../../helpers/constants/constants.dart';

class WeatherResponseWidget extends HookConsumerWidget {
  const WeatherResponseWidget({super.key, this.weatherDetails});

  final WeatherModel? weatherDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Row(children: [
                  Image.asset(AppConstants.sun.imgAsset()),
                  const SizedBox(width: 72),
                  Text('7', style: GoogleFonts.courierPrime(fontSize: 64)),
                ]),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: weatherDetails?.forecast.forecastDay.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: const Row(
                            children: [
                              Text('data'),
                              SizedBox(width: 42),
                              Text('data'),
                              SizedBox(width: 42),
                              Text('data'),
                              SizedBox(width: 42),
                              Text('data'),
                            ],
                          ));
                    }),
              )
            ]));
  }
}
