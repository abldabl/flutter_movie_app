import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/widgets/movie_info_card.dart';
import 'package:flutter_movie/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_movie/models/movie_info.dart';
import 'package:flutter_movie/repositories/movie_info_repo.dart';
import 'package:flutter_movie/services/error_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieInfoDetails extends StatelessWidget {
  int movieId;
  MovieInfoDetails({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieInfoRepository movieInfoRepository = MovieInfoRepository(movieId);
    return FutureBuilder<MovieInfo>(
        future: movieInfoRepository.getMovieInfo(http.Client(), context),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return errorServie(context, snapshot.error);
          } else if (snapshot.hasData) {
            var data = snapshot.data!;
            var genresRender = [];
            for (var item in data.genres) {
              genresRender.add(item.name);
            }
            return ListView(
              children: [
                Stack(
                  children: [
                    Ink.image(
                      image: NetworkImage(data.backDropUrl),
                      fit: BoxFit.cover,
                      height: 320,
                    ),
                    Container(
                      height: 320.0,
                      decoration:
                          const BoxDecoration(gradient: movieInfoCardGradient),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: arrowBack,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Text(
                                  data.name,
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                        ),
                        MovieDetailCard(
                          posterPath: data.posterUrl,
                          runtime: data.runtime,
                          releaseDate: data.releaseDate,
                          budget: data.budget,
                          voteAverage: data.vote,
                          adult: data.adult,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 43),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16, left: 16, bottom: 19),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context).aboutMovie,
                          style: text18),
                      const SizedBox(height: 8),
                      Text(genresRender.join(', '),
                          style: const TextStyle(
                              fontSize: 17, color: Color(0xAAFFFFFF))),
                      const SizedBox(height: 9),
                      Text(data.overview, style: text18),
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
