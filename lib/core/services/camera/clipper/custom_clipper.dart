import 'package:flutter/material.dart';

class CameraViewClipper extends CustomClipper<Rect>{
  final Size cameraSize;
  const CameraViewClipper(this.cameraSize);

  @override
  getClip(Size size) {
    return Rect.fromLTWH(0, 0, cameraSize.width, cameraSize.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
  
}