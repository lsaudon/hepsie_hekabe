// ignore_for_file: avoid_classes_with_only_static_members
import 'dart:async';

import 'package:flutter/services.dart';

class HepsieHekabeInfrastructure {
  static const MethodChannel _channel =
      MethodChannel('hepsie_hekabe_infrastructure');

  static Future<String> get platformVersion async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
