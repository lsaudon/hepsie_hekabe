import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hepsie_hekabe_infrastructure/hepsie_hekabe_infrastructure.dart';

void main() {
  const channel = MethodChannel('hepsie_hekabe_infrastructure');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await HepsieHekabeInfrastructure.platformVersion, '42');
  });
}
