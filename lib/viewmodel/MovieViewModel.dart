import 'package:flutter/cupertino.dart';
import 'package:movie_roll/model/MovieModel.dart';
import 'package:movie_roll/services/MovieApiService.dart';

class MovieViewModel extends ChangeNotifier {
  late final MovieApiService apiService;

  List<MovieModel> movie = []; //list of fetch movies
  bool isLoading = false;

//constructor to inject api service
  MovieViewModel(this.apiService);

// Method to fetch movies and update the UI
  Future<void> fetchMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      //fetch from api
      movie = await apiService.getPopularMovies();
    } catch (e) {
      print("Error fetching movies: $e");
    }

    isLoading = false; // Stop loading
    notifyListeners(); // Notify UI about state change
  }
}
