import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fixmedia_permission_platform_interface.dart';

/// An implementation of [FixmediaPermissionPlatform] that uses method channels.
class MethodChannelFixmediaPermission extends FixmediaPermissionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fixmedia_permission');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  //requestPermission
  @override
  Future<dynamic> requestPermission() async {
      final result = await methodChannel.invokeMethod('requestPermission');
      return result;
  }
}
