import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:camera/camera.dart';

class CameraControllerNotifier extends StateNotifier<CameraController?> {
  CameraControllerNotifier() : super(null) {
    _initializeCamera();
  }

  double get aspectRatio => state!.value.aspectRatio;
  bool get isInitialized => state!.value.isInitialized; 
  


  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();

    if(cameras.isNotEmpty){
      final future = CameraController(cameras[1], ResolutionPreset.max);
      
      await future.initialize();

      state = future;
      }

  }


  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
  
}