







import 'package:flutter/material.dart';

import '../../home_detail/view/view.dart';
import 'package:movie_library/movie_library.dart';

class Carousel extends StatelessWidget {
  final String title;
  final List<Item> items;

  Carousel({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(item: item),
                    ),
                  );
                },
                child: SizedBox(
                  width: 150,
                  height: 250,
                  child: Column(
                    children: [
                      Expanded(child: Image.network('https://image.tmdb.org/t/p/w200${item.imageUrl}')),
                      Text(item.title??"test",textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
