

import 'dart:convert';
import 'package:http/http.dart' as http;


class MovieLibrary {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = '3d0cda4466f269e793e9283f6ce0b75e'; // Replace with your actual API key



  Future<List<dynamic>> searchItems(String query) async {
    final String url = '$_baseUrl/search/multi?api_key=$_apiKey&query=$query';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('results')) {
          return data['results'] as List<dynamic>;
        } else {
          throw Exception('Results key not found in API response');
        }
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
