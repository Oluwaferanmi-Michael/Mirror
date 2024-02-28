import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class WeatherWidget extends ConsumerWidget{
  const WeatherWidget({super.key, this.networkImage, this.temperature});

  final String? networkImage;
  final String? temperature;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        networkImage != null ? SizedBox(child: Image.network(networkImage!)) : Container(
          decoration: BoxDecoration(color: Colors.yellowAccent,
          borderRadius: BorderRadius.circular(100),),
          ),
        
        temperature != null ? Text(temperature!) :  Text('7${String.fromCharCode(0176)}')
      ]
    );
  }
}