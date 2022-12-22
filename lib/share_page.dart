import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

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
              'share_plus',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () => callNative("tweetOnly"),
              child: const Text('Tweet'),
            ),
            ElevatedButton(
              onPressed: () => callNative("tweetPost"),
              child: const Text('Tweet'),
            ),
            ElevatedButton(
              onPressed: () => callNative("linkedin"),
              child: const Text('Linkedin'),
            ),
            ElevatedButton(
              onPressed: () => callNative("whatsapp"),
              child: const Text('Whatsapp'),
            ),
          ],
        ),
      ),
    );
  }
}

callNative(String socialMedia) async {
  var methodChannel = const MethodChannel('example.com/channel');

  try {
    var data = await methodChannel.invokeMethod(socialMedia);
    print(' ###### main $data');
  } on PlatformException catch (e) {
    return "Failed to Invoke: '${e.message}'.";
  }
}

Future withText() async {
  Share.share("DEMO TEXT");
}

Future withImage() async {
  ByteData imageByte = await rootBundle.load('assets/mfasset.jpeg');
  final temp = await getTemporaryDirectory();
  final path = '${temp.path}/referLogo.jpeg';
  File(path).writeAsBytesSync(imageByte.buffer.asUint8List());
  Share.shareFiles([path]);
}

Future withImageText() async {
  ByteData imageByte = await rootBundle.load('assets/mfasset.jpeg');
  final temp = await getTemporaryDirectory();
  final path = '${temp.path}/referLogo.jpeg';
  File(path).writeAsBytesSync(imageByte.buffer.asUint8List());
  Share.shareFiles([path]);
  await Share.shareFiles(
    [path],
    text: 'DEMO TEXT \n\nhttps://1finance.onelink.me/5Kxt/u1yi1ykq',
  );
}

Future withImageURL() async {
  var urls =
      'https://pbs.twimg.com/profile_images/1583320829168742400/0nClIzSM_400x400.jpg';
  final url = Uri.parse(urls);
  final res = await http.get(url);
  final bytes = res.bodyBytes;
  final temp = await getTemporaryDirectory();
  final path = '${temp.path}/imageToShare.jpg';
  File(path).writeAsBytesSync(bytes);
  await Share.shareFiles(
    [path],
    text: 'DEMO TEXT \n\nhttps://1finance.onelink.me/5Kxt/u1yi1ykq',
  );
}
