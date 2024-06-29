


import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const SearchItem({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search',
        ),
        onSubmitted: onSearch,
      ),
    );
  }
}