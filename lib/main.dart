import 'package:flutter/material.dart';
import 'package:onefdemo/audio_player/audio_player.dart';
// import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AudioPlayer(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(
//           vertical: MediaQuery.of(context).size.height * 0.2,
//         ),
//         alignment: Alignment.center,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             const Text(
//               'Share',
//               style: TextStyle(fontSize: 18),
//             ),
//             ElevatedButton(
//               onPressed: () => textWhatsApp(),
//               child: const Text('WhatsApp'),
//             ),
//             ElevatedButton(
//               onPressed: () => textTwitterPost('tweetPost'),
//               child: const Text('Twitter Post'),
//             ),
//             ElevatedButton(
//               onPressed: () => textTwitterPost('tweetDM'),
//               child: const Text('Twitter DM'),
//             ),
//             ElevatedButton(
//               onPressed: () => textLinkedIn(),
//               child: const Text('LinkedIn DM')
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Future textWhatsApp() async {
//   //   launchUrl(Uri.parse("whatsapp://send/?text='Hi, how are you?'"));
//   // }

//   Future textTwitterPost(String method) async {
//     var methodChannel = const MethodChannel('example.com/channel');

//     try {
//       var data = await methodChannel.invokeMethod(method);
//       print(' ###### main $data');
//     } on PlatformException catch (e) {
//       return "Failed to Invoke: '${e.message}'.";
//     }
//   }

//   Future textLinkedIn() async {
//     var methodChannel = const MethodChannel('example.com/channel');

//     try {
//       var data = await methodChannel.invokeMethod('linkedIn');
//       print(' ###### main $data');
//     } on PlatformException catch (e) {
//       return "Failed to Invoke: '${e.message}'.";
//     }
//   }

//   // Future withText() async {
//   //   Share.share("DEMO TEXT");
//   // }

//   // Future withImage() async {
//   //   ByteData imageByte = await rootBundle.load('assets/mfasset.jpeg');
//   //   final temp = await getTemporaryDirectory();
//   //   final path = '${temp.path}/referLogo.jpeg';
//   //   File(path).writeAsBytesSync(imageByte.buffer.asUint8List());
//   //   Share.shareFiles([path]);
//   // }

//   // Future withImageText() async {
//   //   ByteData imageByte = await rootBundle.load('assets/mfasset.jpeg');
//   //   final temp = await getTemporaryDirectory();
//   //   final path = '${temp.path}/referLogo.jpeg';
//   //   File(path).writeAsBytesSync(imageByte.buffer.asUint8List());
//   //   Share.shareFiles([path]);
//   //   await Share.shareFiles(
//   //     [path],
//   //     text: 'DEMO TEXT \n\nhttps://1finance.onelink.me/5Kxt/u1yi1ykq',
//   //   );
//   // }

//   // Future withImageURL() async {
//   //   var urls =
//   //       'https://pbs.twimg.com/profile_images/1583320829168742400/0nClIzSM_400x400.jpg';
//   //   final url = Uri.parse(urls);
//   //   final res = await http.get(url);
//   //   final bytes = res.bodyBytes;
//   //   final temp = await getTemporaryDirectory();
//   //   final path = '${temp.path}/imageToShare.jpg';
//   //   File(path).writeAsBytesSync(bytes);
//   //   await Share.shareFiles(
//   //     [path],
//   //     text: 'DEMO TEXT \n\nhttps://1finance.onelink.me/5Kxt/u1yi1ykq',
//   //   );
//   // }
// }
