// import 'package:flutter_test/flutter_test.dart';
// import 'package:app/app.dart';
// import 'package:app/app_platform_interface.dart';
// import 'package:app/app_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockAppPlatform
//     with MockPlatformInterfaceMixin
//     implements AppPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final AppPlatform initialPlatform = AppPlatform.instance;
//
//   test('$MethodChannelApp is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelApp>());
//   });
//
//   test('getPlatformVersion', () async {
//     App appPlugin = App();
//     MockAppPlatform fakePlatform = MockAppPlatform();
//     AppPlatform.instance = fakePlatform;
//
//     expect(await appPlugin.getPlatformVersion(), '42');
//   });
// }
