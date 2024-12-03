class MovieModel {
  // Movie properties
  final String title; // Title of the movie
  final String posterUrl; // URL for the movie poster image
  final String description; // Overview of the movie
  final String releaseDate; // Release date of the movie
  final double rating;

  MovieModel(
      {required this.title,
      required this.posterUrl,
      required this.description,
      required this.releaseDate,
      required this.rating});

  //factory method to create a movie object to json map
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        title: json['title'],
        posterUrl: json['poster_path'],
        description: json['overview'],
        releaseDate: json['release_date'],
        rating: json['vote_average'].toDouble());
  }
}
