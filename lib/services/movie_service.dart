import '../models/movie.dart';

class MovieService {
  List<Movie> sortByName(List<Movie> movies) {
    movies.sort((a, b) => a.title.compareTo(b.title));
    return movies;
  }

  List<Movie> sortByDate(List<Movie> movies) {
    movies.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
    return movies;
  }

  List<Movie> sortByVotes(List<Movie> movies) {
    movies.sort((a, b) => b.vote.compareTo(a.vote));
    return movies;
  }
}
