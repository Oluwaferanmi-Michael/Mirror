
import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirror/core/services/camera/controller/camera_controller_notifier.dart';

final cameraControllerProvider = StateNotifierProvider<CameraControllerNotifier, CameraController?>((ref) => CameraControllerNotifier());