import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mirror/core/services/camera/provider/camera_controller_provider.dart';
import 'package:mirror/core/services/permissions/permissions_provider/permissions_provider.dart';

import '../../core/services/camera/clipper/custom_clipper.dart';

class TestView3 extends ConsumerStatefulWidget {
  const TestView3({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestView3State();
}



class _TestView3State extends ConsumerState<TestView3> {

  @override
  Widget build(BuildContext context) {

    final permission = ref.watch(permissionsProvider).cameraPermission;
    final permissionNotifier = ref.watch(permissionsProvider.notifier);
    final cameraController = ref.watch(cameraControllerProvider);
    final cameraControllerNotifier = ref.watch(cameraControllerProvider.notifier);
    final mediaSize = MediaQuery.of(context).size;

    if(permission != true){
      permissionNotifier.askCameraPermission().then(
      (value) {
        if(value != true){
          return const Scaffold(body: SizedBox(child: Center(child: Text('test 3 view'))));
        }
      });
      // return const Scaffold(body: SizedBox(child: Center(child: Text('test 3 view'))));
    }

    return cameraController == null || !cameraControllerNotifier.isInitialized ?
      
      const Center(child: CircularProgressIndicator()) :

          ClipRect(
            clipper: CameraViewClipper(mediaSize),
            child: Transform.scale(
              scale: 1.2 / (cameraControllerNotifier.aspectRatio * mediaSize.aspectRatio),
              alignment: Alignment.center,
              child: CameraPreview(cameraController)
            ),
          );
  }
}