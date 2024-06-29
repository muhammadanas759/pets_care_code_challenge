// lib/app/screens/detail_screen.dart
import 'package:flutter/material.dart';
import '../../player_screen/player_screen.dart';
import 'package:movie_library/movie_library.dart';


class DetailScreen extends StatelessWidget {
  final Item item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title??"")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.network('https://image.tmdb.org/t/p/w500${item.imageUrl}'),
          Text(item.description??""),
          if (item.type == 'movie' || item.type == 'tv')
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerScreen(imageUrl: item.imageUrl??""),
                  ),
                );
              },
              child: Text('Play'),
            ),
        ],
      ),
    );
  }
}
