import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fixmedia_permission_method_channel.dart';

abstract class FixmediaPermissionPlatform extends PlatformInterface {
  /// Constructs a FixmediaPermissionPlatform.
  FixmediaPermissionPlatform() : super(token: _token);

  static final Object _token = Object();

  static FixmediaPermissionPlatform _instance = MethodChannelFixmediaPermission();

  /// The default instance of [FixmediaPermissionPlatform] to use.
  ///
  /// Defaults to [MethodChannelFixmediaPermission].
  static FixmediaPermissionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FixmediaPermissionPlatform] when
  /// they register themselves.
  static set instance(FixmediaPermissionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  //requestPermission
  Future<dynamic> requestPermission() {
    throw UnimplementedError('requestPermission() has not been implemented.');
  }
}
