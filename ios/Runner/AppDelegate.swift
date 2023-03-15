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
         var shareText = ""
         if let args = call.arguments as? Dictionary<String, Any>,
           let text = args["text"] as? String {
             shareText=text
           result(nil)
         } else {
           result(FlutterError.init(code: "errorSetDebug", message: "data or format error", details: nil))
         }
         
         if(call.method=="whatsapp"){
//             let whatsappURL = URL(string: (urlWhats as String).addingPercentEscapes(using: .utf8) ?? "")
//             let content = shareText
             let urlWhats = "whatsapp://send?text=\(shareText)"
             let whatsappURL=URL(string:  (urlWhats as String).addingPercentEncoding(withAllowedCharacters: .urlAllowedCharacters)!)!
             if (UIApplication.shared.canOpenURL(whatsappURL)) {
                 UIApplication.shared.open(whatsappURL)
                 result("success")
             } else {
                 result("error")
             }
             //
         }else if(call.method=="tweet"){
 let urlWhats = "twitter://post?message=\(shareText)"
             let whatsappURL=URL(string:  (urlWhats as String).addingPercentEncoding(withAllowedCharacters: .urlAllowedCharacters)!)!
             if (UIApplication.shared.canOpenURL(whatsappURL)) {
                 UIApplication.shared.open(whatsappURL)
                 result("success")
             } else {
                 result("error")
             }
         }else if(call.method=="linkedin"){
 let urlWhats = "https://www.linkedin.com/shareArticle?mini=true&url=https://1finance.co.in/"
             let whatsappURL=URL(string:  urlWhats)
             if (UIApplication.shared.canOpenURL(whatsappURL!)) {
                 UIApplication.shared.open(whatsappURL!)
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

extension CharacterSet {
    
    /// Characters valid in part of a URL.
    ///
    /// This set is useful for checking for Unicode characters that need to be percent encoded before performing a validity check on individual URL components.
    static var urlAllowedCharacters: CharacterSet {
        // You can extend any character set you want
        var characters = CharacterSet.urlQueryAllowed
        characters.subtract(CharacterSet(charactersIn: "+"))
        return characters
    }
}
