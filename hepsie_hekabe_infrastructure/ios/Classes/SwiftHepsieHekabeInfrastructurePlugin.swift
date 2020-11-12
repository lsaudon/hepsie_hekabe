import Flutter
import UIKit

public class SwiftHepsieHekabeInfrastructurePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "hepsie_hekabe_infrastructure", binaryMessenger: registrar.messenger())
    let instance = SwiftHepsieHekabeInfrastructurePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
