import UIKit
import Flutter

@available(iOS 10.0, *)
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let flutterChannel = FlutterMethodChannel(name: "1fin/share",
                                                 binaryMessenger: controller.binaryMessenger)

     flutterChannel.setMethodCallHandler({
         (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          
          // guard call.method == "iosLinkedin" else {
          //     result(FlutterMethodNotImplemented)
          //     return
          //   }
          // self.shareTextData(result: result)
          
         if(call.method=="whatsapp"){
//             let whatsappURL = URL(string: (urlWhats as String).addingPercentEscapes(using: .utf8) ?? "")
             let content = "This is my text to send."
             let urlWhats = "whatsapp://send?text=\(content)"
             let whatsappURL=URL(string:  (urlWhats as String).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
             if (UIApplication.shared.canOpenURL(whatsappURL)) {
                 UIApplication.shared.openURL(whatsappURL)
                 result("success")
             } else {
                 result("error")
             }
             //
         }else if(call.method=="tweet"){
 let urlWhats = "twitter://post?message=\("This is my text to send.")"
             let whatsappURL=URL(string:  (urlWhats as String).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
             if (UIApplication.shared.canOpenURL(whatsappURL)) {
                 UIApplication.shared.openURL(whatsappURL)
                 result("success")
             } else {
                 result("error")
             }
         }else if(call.method=="linkedin"){
 let urlWhats = "https://www.linkedin.com/shareArticle?mini=true&url=https://www.google.com/"
             let whatsappURL=URL(string:  urlWhats)
             if (UIApplication.shared.canOpenURL(whatsappURL!)) {
                 UIApplication.shared.openURL(whatsappURL!)
                 result("success")
             } else {
                 result("error")
             }
         }
       })                                             
      GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

//    @available(iOS 10.0, *)
//    private func shareTextData(result: FlutterResult) {
//          let originalString = "First Whatsapp Share"
//              let escapedString = originalString.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)
//
//              let url  = URL(string: "https://www.linkedin.com/shareArticle?mini=true&url=http://chillyfacts.com/create-linkedin-share-button-on-website-webpages&title=Create&summary=chillyfacts.com&source=Chillyfacts")
//              // let url  = URL(string: "https://www.linkedin.com/sharing/share-offsite/?url=https%3A%2F%2Fwww.google.com%2Fimages%2Fbranding%2Fgooglelogo%2F2x%2Fgooglelogo_color_272x92dp.png")
//              // let url  = URL(string: "whatsapp://send?text=\(escapedString!)")
//
//              if UIApplication.shared.canOpenURL(url! as URL)
//              {
//                  UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
//              }
//          }

         /*
        //  whatsapp
let urlWhats = "whatsapp://send?text=\("content")"
let whatsappURL = URL(string: (urlWhats as String).addingPercentEscapes(using: String.Encoding.utf8.rawValue) ?? "")

        if (UIApplication.shared.canOpenURL(whatsappURL)) {
    UIApplication.shared.openURL(whatsappURL)
    result("success")
} else {
    result("error")
}
        */
//----------------------------------------------------------------------------------------------

       /* Tweet share
   let captionText = "Hi, How are you?"
urlSchemeTwitter = "twitter://post?message=\(captionText)"
let urlTextEscaped = (urlSchemeTwitter as NSString).addingPercentEscapes(using: String.Encoding.utf8.rawValue)
let urlSchemeSend = URL(string: urlTextEscaped)
if #available(iOS 10.0, *) {
    if let urlSchemeSend {
        UIApplication.shared.open(urlSchemeSend, options: [:])
    }
    result("success")
} else {
    result("error")
}
    */
//----------------------------------------------------------------------------------------------
/* battery check
          let device = UIDevice.current
          device.isBatteryMonitoringEnabled = true
          if device.batteryState == UIDevice.BatteryState.unknown {
            result(FlutterError(code: "UNAVAILABLE",
                                message: "Battery level not available.",
                                details: nil))
          } else {
            result(Int(device.batteryLevel * 100))
          }*/
//----------------------------------------------------------------------------------------------

          /*  Linkedin
        
        let urlSchemeTwitter = String(format: "https://www.linkedin.com/shareArticle?mini=true&url=${captionText}", captionText)
let urlTextEscaped = (urlSchemeTwitter as NSString).addingPercentEscapes(using: String.Encoding.utf8.rawValue)
let urlSchemeSend = URL(string: urlTextEscaped ?? "")
  if #available(iOS 10.0, *) {
    UIApplication.shared.open(urlSchemeSend, options: [:])
    result("success")
} else {
    result("error")
}

          */
          
    }

