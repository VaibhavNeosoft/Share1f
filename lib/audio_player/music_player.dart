import 'package:flutter/material.dart';

class MusicPlayerCard extends StatefulWidget {
  final String title;
  final String artist;
  final String albumArt;
  final int rating;
  final int index;

  const MusicPlayerCard({
    super.key,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.rating,
    required this.index,
  });

  @override
  State<MusicPlayerCard> createState() => _MusicPlayerCardState();
}

class _MusicPlayerCardState extends State<MusicPlayerCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          elevation: 30,
          color: Colors.transparent,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
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
                  child: Image.network(
                    widget.albumArt,
                    fit: BoxFit.cover,
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
    );
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
