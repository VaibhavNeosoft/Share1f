import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:share_extend/share_extend.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Share'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Share',
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                  onPressed: () async {
                    ByteData imageByte =
                        await rootBundle.load('assets/mfasset.jpeg');
                    final temp = await getTemporaryDirectory();
                    final path = '${temp.path}/referLogo.jpeg';
                    File(path).writeAsBytesSync(imageByte.buffer.asUint8List());
                    ShareExtend.share(
                      path,
                      "image",
                      extraText: "Hi, How are you?",
                    );
                  },
                  child: const Text('With Image')),
              ElevatedButton(
                  onPressed: () => shareImage(),
                  child: const Text('With Image URL')),
            ]),
      ),
    );
  }

  Future shareImage() async {
    var urls =
        'https://pbs.twimg.com/profile_images/1583320829168742400/0nClIzSM_400x400.jpg';
    final url = Uri.parse(urls);
    final res = await http.get(url);
    final bytes = res.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/imageToShare.jpg';
    File(path).writeAsBytesSync(bytes);
    await Share.shareFiles([path], text: 'Hi, How are you?');
  }
}
