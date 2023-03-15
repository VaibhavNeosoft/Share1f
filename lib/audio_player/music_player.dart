import 'package:flutter/material.dart';

class MusicPlayerCard extends StatefulWidget {
  final String title;
  final String artist;
  final String albumArt;
  final int rating;
  final int index;
  final int currentPageIndex;
  final PageController pageController;
  final Animation<double> animation1;
  final Animation<double> animation2;
  final Animation<double> heightAnimation;
  final Animation<double> heightAnimation2;
  final AnimationController controller;

  const MusicPlayerCard({
    super.key,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.rating,
    required this.index,
    required this.pageController,
    required this.currentPageIndex,
    required this.animation1,
    required this.animation2,
    required this.heightAnimation,
    required this.heightAnimation2,
    required this.controller, required scale,
  });

  @override
  State<MusicPlayerCard> createState() => _MusicPlayerCardState();
}

class _MusicPlayerCardState extends State<MusicPlayerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Material(
            elevation: 30,
            color: Colors.transparent,
            child: Container(
              height: widget.currentPageIndex == widget.index
                  ? MediaQuery.of(context).size.height * widget.heightAnimation.value
                  : MediaQuery.of(context).size.height * widget.heightAnimation2.value,
              width: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: ScaleTransition(
                      scale: getScale(),
                      child: Image.network(
                        widget.albumArt,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  title(),
                  const SizedBox(height: 8.0),
                  subtitle(),
                  const SizedBox(height: 16.0),
                  rating(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Animation<double> getScale() {
    if ((widget.index == widget.currentPageIndex)) return widget.animation1;
    return widget.animation2;
  }

  Row rating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          index < widget.rating ? Icons.star : Icons.star_border,
          size: 32.0,
          color: Colors.yellow[700],
        );
      }),
    );
  }

  Text subtitle() {
    return Text(
      widget.title,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text title() {
    return Text(
      widget.artist,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.grey[600],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class PullDownWidget extends StatefulWidget {
  const PullDownWidget({super.key});

  @override
  _PullDownWidgetState createState() => _PullDownWidgetState();
}

class _PullDownWidgetState extends State<PullDownWidget> {
  bool _isExpanded = false;
  double _containerHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          if (_isExpanded && details.delta.dy < 0) {
            _isExpanded = false;
            _containerHeight = 100.0;
          } else if (!_isExpanded && details.delta.dy > 0) {
            _isExpanded = true;
            _containerHeight = 300.0;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: _containerHeight,
        color: Colors.blue,
        child: const Center(
          child: Text(
            "Pull me down!",
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
