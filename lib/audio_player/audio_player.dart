import 'package:flutter/material.dart';

import 'music_player.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({super.key});

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> with SingleTickerProviderStateMixin {
  final PageController pageController = PageController(viewportFraction: 0.8);
  int _currentPageIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> heightAnimation;
  late Animation<double> heightAnimation2;
  final scaleStart = 1.6;
  final scaleEnd = 1.0;
  final heightStart = 0.65;
  final heightEnd = 0.50;

  double scale = 1.6;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _animation1 = Tween<double>(begin: scaleStart, end: scaleEnd).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate))
      ..addListener(() {
        setState(() {});
      });
    _animation2 = Tween<double>(begin: scaleEnd, end: scaleStart).animate(_controller)..addListener(() {});
    heightAnimation = Tween<double>(begin: heightStart, end: heightEnd).animate(_controller)
      ..addListener(() {
        //
      });
    heightAnimation2 = Tween<double>(begin: heightEnd, end: heightStart).animate(_controller)
      ..addListener(() {
        //
      });

    pageController.addListener(() {
// print(' ###### audio_player ${pageController.page}');
    });
  }

// 1.6 1
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                controller: pageController,
                onPageChanged: (int index) {
                  // setState(() {
                  _currentPageIndex = index;
                  // });
                  _controller.reset();
                  _controller.forward();
                },
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return NonExpandableWidget(); 
                  // return MusicPlayerCard(
                  //   pageController: pageController,
                  //   currentPageIndex: _currentPageIndex,
                  //   controller: _controller,
                  //   animation1: _animation1,
                  //   animation2: _animation2,
                  //   scale: scale,
                  //   heightAnimation: heightAnimation,
                  //   heightAnimation2: heightAnimation2,
                  //   albumArt: [
                  //     'https://lastfm.freetls.fastly.net/i/u/ar0/fa41ea957a5341c6bef5fac44f2f0221.jpg',
                  //     'https://assets-global.website-files.com/5e6a544cadf84b1393e2e022/611cfe2fe8dfe7fe77ba50c4_cri_000000319870%20(1).jpeg',
                  //     'https://d1csarkz8obe9u.cloudfront.net/themedlandingpages/tlp_hero_album-covers-d12ef0296af80b58363dc0deef077ecc-1552649680.jpg',
                  //   ][index % 3],
                  //   artist: 'Radiohead',
                  //   title: 'SuperCollider',
                  //   rating: 4,
                  //   index: index,
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class NonExpandableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) {},
      child: Container(
        height: 100.0,
        color: Colors.blue,
        child: Center(
          child: Text(
            "I don't expand!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}