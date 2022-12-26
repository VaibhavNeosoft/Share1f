import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_share/social_share.dart';

class SharePage extends StatefulWidget {
  const SharePage({
    Key? key,
  }) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.2,
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Share Text Only',
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () => callNative("whatsapp"),
              child: const Text('Whatsapp'),
            ),
            ElevatedButton(
              // onPressed: () => socialSharet(),
              onPressed: () => callNative("tweet"),
              child: const Text('Tweet'),
            ),
            ElevatedButton(
              onPressed: () => callNative("linkedin"),
              child: const Text('Linkedin'),
            ),
          ],
        ),
      ),
    );
  }
}

// iOSWhatsapp() {
//   // launchUrl(Uri.parse("twitter://post?message=\(captionText)"))
// // SocialShare.shareTwitter("This is Social Share plugin");
//   SocialShare.shareWhatsapp("content");

//   // var uri = "https://twitter.com/intent/tweet?url={url}&text={title}";
//   // launchUrl(Uri.parse(uri));
// }

// calliOSLinkedin(String s) async {
//   var methodChannel = const MethodChannel('1fin/share');

//   try {
//     var data = await methodChannel.invokeMethod(s);
//     print(' ###### main $data');
//   } on PlatformException catch (e) {
//     return "Failed to Invoke: '${e.message}'.";
//   }
// }

// socialSharet() {
//   SocialShare.("captionText");
//   // launchUrl(Uri.parse('http://www.twitter.com/messages/compose?text=fjsfnn'));
// }

callNative(String socialMedia) async {
  var methodChannel = const MethodChannel('1fin/share');

  try {
    var data = await methodChannel.invokeMethod(socialMedia);
    print(' ###### main $data');
  } on PlatformException catch (e) {
    return "Failed to Invoke: '${e.message}'.";
  }
}

// Future withText() async {
//   Share.share("DEMO TEXT");
// }

// Future withImage() async {
//   ByteData imageByte = await rootBundle.load('assets/mfasset.jpeg');
//   final temp = await getTemporaryDirectory();
//   final path = '${temp.path}/referLogo.jpeg';
//   File(path).writeAsBytesSync(imageByte.buffer.asUint8List());
//   Share.shareFiles([path]);
// }

// Future withImageText() async {
//   ByteData imageByte = await rootBundle.load('assets/mfasset.jpeg');
//   final temp = await getTemporaryDirectory();
//   final path = '${temp.path}/referLogo.jpeg';
//   File(path).writeAsBytesSync(imageByte.buffer.asUint8List());
//   Share.shareFiles([path]);
//   await Share.shareFiles(
//     [path],
//     text: 'DEMO TEXT \n\nhttps://1finance.onelink.me/5Kxt/u1yi1ykq',
//   );
// }

// Future withImageURL() async {
//   var urls =
//       'https://pbs.twimg.com/profile_images/1583320829168742400/0nClIzSM_400x400.jpg';
//   final url = Uri.parse(urls);
//   final res = await http.get(url);
//   final bytes = res.bodyBytes;
//   final temp = await getTemporaryDirectory();
//   final path = '${temp.path}/imageToShare.jpg';
//   File(path).writeAsBytesSync(bytes);
//   await Share.shareFiles(
//     [path],
//     text: 'DEMO TEXT \n\nhttps://1finance.onelink.me/5Kxt/u1yi1ykq',
//   );
// }
