import 'package:flutter_test/flutter_test.dart';
import 'package:fixmedia_permission/fixmedia_permission.dart';
import 'package:fixmedia_permission/fixmedia_permission_platform_interface.dart';
import 'package:fixmedia_permission/fixmedia_permission_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFixmediaPermissionPlatform
    with MockPlatformInterfaceMixin
    implements FixmediaPermissionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future requestPermission() {
    // TODO: implement requestPermission
    throw UnimplementedError();
  }
}

void main() {
  final FixmediaPermissionPlatform initialPlatform = FixmediaPermissionPlatform.instance;

  test('$MethodChannelFixmediaPermission is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFixmediaPermission>());
  });

  test('getPlatformVersion', () async {
    FixmediaPermission fixmediaPermissionPlugin = FixmediaPermission();
    MockFixmediaPermissionPlatform fakePlatform = MockFixmediaPermissionPlatform();
    FixmediaPermissionPlatform.instance = fakePlatform;

    expect(await fixmediaPermissionPlugin.getPlatformVersion(), '42');
  });
}
