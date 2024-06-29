import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  final String imageUrl;

  PlayerScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network('https://image.tmdb.org/t/p/w500$imageUrl'),
      ),
    );
  }
}
