import 'package:flutter/material.dart';
import 'package:movie_roll/ViewModel/MovieViewModel.dart';
import 'package:movie_roll/locator/locator.dart';
import 'package:provider/provider.dart';

class MovielistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the ViewModel instance from GetIt
    final viewModel = locator<MovieViewModel>();

    return ChangeNotifierProvider<MovieViewModel>(
      create: (_) {
        // Fetch movies when the screen is initialized
        viewModel.fetchMovies();
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Popular Movies")),
        body: Consumer<MovieViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              // Show a loading indicator while fetching movies
              return Center(child: CircularProgressIndicator());
            }
            // Display the list of movies
            return ListView.builder(
              itemCount: viewModel.movie.length,
              itemBuilder: (context, index) {
                final movie = viewModel.movie[index];
                return ListTile(
                  leading: Image.network(
                    "https://image.tmdb.org/t/p/w500${movie.posterUrl}",
                  ), // Load poster image
                  title: Text(movie.title), // Show movie title
                  subtitle: Text("Rating: ${movie.rating}"), // Show rating
                  onTap: () {
                    // TODO: Navigate to movie details screen
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
