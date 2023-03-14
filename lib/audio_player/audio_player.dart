import 'package:flutter/material.dart';

import 'music_player.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({super.key});

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        color: Colors.grey.shade500,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView.builder(
                itemCount: 5, // Number of pages
                itemBuilder: (BuildContext context, int index) {
                  return MusicPlayerCard(
                    albumArt: 'https://lastfm.freetls.fastly.net/i/u/ar0/fa41ea957a5341c6bef5fac44f2f0221.jpg',
                    artist: 'Radiohead',
                    title: 'SuperCollider',
                    rating: 4,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
