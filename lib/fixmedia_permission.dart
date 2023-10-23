
import 'fixmedia_permission_platform_interface.dart';

class FixmediaPermission {
  Future<String?> getPlatformVersion() {
    return FixmediaPermissionPlatform.instance.getPlatformVersion();
  }

  //requestPermission
  Future<dynamic> requestPermission() {
    return FixmediaPermissionPlatform.instance.requestPermission();
  }
}
