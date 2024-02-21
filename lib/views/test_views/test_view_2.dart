import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/services/permissions/permissions_provider/permissions_provider.dart';

class TestView2 extends ConsumerStatefulWidget {
  const TestView2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestView2State();
}

class _TestView2State extends ConsumerState<TestView2> {

late CameraController _controller;


@override
void initState() {
  super.initState();
  _controller = CameraController(
    const CameraDescription(
      name: '1',
      lensDirection: CameraLensDirection.front,
      sensorOrientation: 90),
    ResolutionPreset.veryHigh
  );

  _controller.initialize().then(
    (value) {if(!mounted) return;
    });
  
}

@override
void dispose() {
  super.dispose();
  _controller.dispose();
}

  @override
  Widget build(BuildContext context) {

    final permission = ref.watch(permissionsProvider).cameraPermission;

      if (permission != true){
        if(!_controller.value.isInitialized){
          return const Scaffold( body: SizedBox( child: Center(child: Text('nope'))));
          }
      }
      return AspectRatio(
        aspectRatio: 1 / _controller.value.aspectRatio,
        child: CameraPreview(_controller));
    }
  }