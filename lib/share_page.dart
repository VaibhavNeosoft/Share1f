// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:share_plus/share_plus.dart';

// class SharePage extends StatefulWidget {
//   const SharePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<SharePage> createState() => _SharePageState();
// }

// class _SharePageState extends State<SharePage> {
//   String? selectedMedia = 'whatsapp';
//   String? selectedMoneySign = Strings.farSightedEagle;

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
//             const Text('Share Text Only',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const Divider(),
//             // const Text('Select Money Sign', style: TextStyle(fontSize: 18)),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const Text('Select Money Sign:',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

//                 DropdownButton<String>(
//                   value: selectedMoneySign,
//                   items: <String>[
//                     Strings.farSightedEagle,
//                     Strings.virtuousElephant,
//                     Strings.persistentHorse,
//                     Strings.opportunisticLion,
//                     Strings.tacticalTiger,
//                     Strings.stealthyShark,
//                     Strings.vigilantTurtle,
//                     Strings.enlightenedWhale
//                   ].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     selectedMoneySign = value;
//                     setState(() {});
//                   },
//                 ),
//                 // ElevatedButton(
//                 //   onPressed: () {
//                 //     callNative(dropDownValue ?? 'whatsapp');
//                 //   },
//                 //   child: const Text('Share'),
//                 // ),
//               ],
//             ),
//             const Divider(),
//             shareDirectlyButtons(),
//             const Divider(),
//             ElevatedButton(
//               onPressed: () {
//                 Share.share(
//                     getShareText(selectedMoneySign ?? Strings.farSightedEagle));
//               },
//               child: const Text('Share With System'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Row shareDirectlyButtons() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         DropdownButton<String>(
//           value: selectedMedia,
//           items: <String>['whatsapp', 'tweet', 'linkedin'].map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value.toUpperCase()),
//             );
//           }).toList(),
//           onChanged: (value) {
//             selectedMedia = value;
//             setState(() {});
//           },
//         ),
//         ElevatedButton(
//           onPressed: () {
//             callNative(selectedMedia ?? 'whatsapp',
//                 selectedMoneySign ?? Strings.farSightedEagle);
//           },
//           child: const Text('Share'),
//         ),
//       ],
//     );
//   }
// }

// callNative(String socialMedia, String moneySign) async {
//   var methodChannel = const MethodChannel('1fin/share');
//   var text = getShareText(moneySign);
//   try {
//     var data = await methodChannel.invokeMethod(socialMedia, {"text": text});
//     print(' ###### main $data');
//   } on PlatformException catch (e) {
//     return "Failed to Invoke: '${e.message}'.";
//   }
// }

// String getShareText(String moneySign) {
//   String properLink = '';
//   String textFirst =
//       'I found my MoneySign™ 🤩 thanks to @1FinanceHQ. I’m ready to take control of my finances as I now know my financial psychology!\n\n';
//   // 'I’m ready to take control of my finances as I now know my financial psychology!\n\n'
//   // 'Here’s my MoneySign™: ';

//   String textLast = 'Here’s my MoneySign™: ';
//   String resultText = '';
//   Map mapped = {
//     Strings.farSightedEagle: 'https://onefin.app/msegl',
//     Strings.virtuousElephant: 'https://onefin.app/mseph',
//     Strings.persistentHorse: 'https://onefin.app/mshrs',
//     Strings.opportunisticLion: 'https://onefin.app/mslio',
//     Strings.tacticalTiger: 'https://onefin.app/mstgr',
//     Strings.stealthyShark: 'https://onefin.app/msark',
//     Strings.enlightenedWhale: 'https://onefin.app/mswha',
//     Strings.vigilantTurtle: 'https://onefin.app/msttl',
//   };
//   properLink = mapped[moneySign];
//   resultText = textFirst + textLast + properLink;
//   return resultText;
// }

// class Strings {
//   static const farSightedEagle = "Far-sighted Eagle";
//   static const virtuousElephant = "Virtuous Elephant";
//   static const persistentHorse = "Persistent Horse";
//   static const opportunisticLion = "Opportunistic Lion";
//   static const tacticalTiger = "Tactical Tiger";
//   static const stealthyShark = "Stealthy Shark";
//   static const vigilantTurtle = "Vigilant Turtle";
//   static const enlightenedWhale = "Enlightened Whale";
// }

// // iOSWhatsapp() {
// //   // launchUrl(Uri.parse("twitter://post?message=\(captionText)"))
// // // SocialShare.shareTwitter("This is Social Share plugin");
// //   SocialShare.shareWhatsapp("content");

// //   // var uri = "https://twitter.com/intent/tweet?url={url}&text={title}";
// //   // launchUrl(Uri.parse(uri));
// // }

// // calliOSLinkedin(String s) async {
// //   var methodChannel = const MethodChannel('1fin/share');

// //   try {
// //     var data = await methodChannel.invokeMethod(s);
// //     print(' ###### main $data');
// //   } on PlatformException catch (e) {
// //     return "Failed to Invoke: '${e.message}'.";
// //   }
// // }

// // socialSharet() {
// //   SocialShare.("captionText");
// //   // launchUrl(Uri.parse('http://www.twitter.com/messages/compose?text=fjsfnn'));
// // }


// // Future withText() async {
// //   Share.share("DEMO TEXT");
// // }

// // Future withImage() async {
// //   ByteData imageByte = await rootBundle.load('assets/mfasset.jpeg');
// //   final temp = await getTemporaryDirectory();
// //   final path = '${temp.path}/referLogo.jpeg';
// //   File(path).writeAsBytesSync(imageByte.buffer.asUint8List());
// //   Share.shareFiles([path]);
// // }

// // Future withImageText() async {
// //   ByteData imageByte = await rootBundle.load('assets/mfasset.jpeg');
// //   final temp = await getTemporaryDirectory();
// //   final path = '${temp.path}/referLogo.jpeg';
// //   File(path).writeAsBytesSync(imageByte.buffer.asUint8List());
// //   Share.shareFiles([path]);
// //   await Share.shareFiles(
// //     [path],
// //     text: 'DEMO TEXT \n\nhttps://1finance.onelink.me/5Kxt/u1yi1ykq',
// //   );
// // }

// // Future withImageURL() async {
// //   var urls =
// //       'https://pbs.twimg.com/profile_images/1583320829168742400/0nClIzSM_400x400.jpg';
// //   final url = Uri.parse(urls);
// //   final res = await http.get(url);
// //   final bytes = res.bodyBytes;
// //   final temp = await getTemporaryDirectory();
// //   final path = '${temp.path}/imageToShare.jpg';
// //   File(path).writeAsBytesSync(bytes);
// //   await Share.shareFiles(
// //     [path],
// //     text: 'DEMO TEXT \n\nhttps://1finance.onelink.me/5Kxt/u1yi1ykq',
// //   );
// // }

//   // # image_picker: ^0.8.6
//   // # path_provider: ^2.0.11
//   // # receive_sharing_intent: ^1.4.5
//   // # share_extend: ^2.0.0
//   // share_plus: ^6.3.0
//   // # social_share: ^2.3.1
//   // # url_launcher: ^6.1.7