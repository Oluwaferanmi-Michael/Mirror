
import 'package:permission_handler/permission_handler.dart';

class CameraPermit{
  const CameraPermit();

  Future<PermissionStatus> checkCameraPermission() =>
    Permission.camera.status;

  Future<PermissionStatus> requestCameraPermission() =>
    Permission.camera.request();


}