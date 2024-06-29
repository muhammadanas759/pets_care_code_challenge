

import 'package:movie_library/repository/movie_repository.dart';

import '../model/item.dart';
import '../movie_library/movie_library.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieLibrary apiProvider;

  MovieRepositoryImpl(this.apiProvider);

  @override
  Future<List<Item>> searchItems(String query) async {
    try {
      final results = await apiProvider.searchItems(query);
      List<Item> items = results.map((result) => Item.fromJson(result)).toList();
      return items;
    } catch (e) {
      throw Exception('Failed to fetch items: $e');
    }
  }
}