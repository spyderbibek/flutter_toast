import Flutter
import UIKit

public class SwiftFluttertoastPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "fluttertoast", binaryMessenger: registrar.messenger())
    let instance = SwiftFluttertoastPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if (call.method == "showToast"){
          var map = call.arguments as? Dictionary<String, String>
          var message = map?["message"]
          var alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true)
      }
    }
}
