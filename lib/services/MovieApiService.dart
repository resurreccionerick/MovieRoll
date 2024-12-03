import 'dart:convert';

import 'package:movie_roll/constants/constants.dart';
import 'package:movie_roll/model/MovieModel.dart';

class MovieApiService {
  // Fetch popular movies from the API
  Future<List<MovieModel>> getPopularMovies() async {
    final url = Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"); // Use constants
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body); // Parse JSON response
      final List results = data['results']; // Extract movies list
      return results.map((movie) => MovieModel.fromJson(movie)).toList(); // Convert to Movie objects
    } else {
      throw Exception("Failed to fetch movies");
    }
  }
}