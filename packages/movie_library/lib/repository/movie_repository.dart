

import '../model/model.dart';

abstract class MovieRepository {
  Future<List<Item>> searchItems(String query);
}