import 'package:flutter/material.dart';
import 'package:flutter_movie/services/error_service.dart';
import 'package:flutter_movie/utils/enum.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_movie/models/movie.dart';
import 'package:flutter_movie/repositories/movie_repo.dart';
import 'package:flutter_movie/services/movie_service.dart';
import 'package:flutter_movie/ui/widgets/movie_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoviesList extends StatelessWidget {
  SortBy sortingState;

  MoviesList({
    Key? key,
    required this.sortingState,
  }) : super(key: key);

  MovieRepository movieRepository = MovieRepository();

  MovieService movieService = MovieService();

  List<Movie> _sortBy(List<Movie> movies) {
    if (SortBy.byDate == sortingState) {
      return movieService.sortByDate(movies);
    } else if (SortBy.byName == sortingState) {
      return movieService.sortByName(movies);
    } else if (SortBy.byVote == sortingState) {
      return movieService.sortByVotes(movies);
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
        future: movieRepository.getMovies(http.Client(), context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return errorServie(context, snapshot.error);
          } else if (snapshot.hasData) {
            final movies = snapshot.data!;
            if (movies.isEmpty) {
              return Center(
                child: Text(AppLocalizations.of(context).noMovie),
              );
            }
            var sortedMovies = _sortBy(movies);

            return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                children: List.generate(sortedMovies.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MovieCard(
                      id: sortedMovies[index].id,
                      posterPath: sortedMovies[index].posterPath,
                      title: sortedMovies[index].title,
                      releaseDate: sortedMovies[index].releaseDate,
                      vote: sortedMovies[index].vote,
                    ),
                  );
                }));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
