import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_movie/models/movie_info.dart';
import 'package:flutter_movie/utils/exceptions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieInfoRepository {
  int movieId;
  MovieInfoRepository(
    this.movieId,
  );

  MovieInfo parseMovieInfo(String body) {
    var parsed = jsonDecode(body);
    return MovieInfo.fromJson(parsed);
  }

  Future<MovieInfo> getMovieInfo(
      http.Client client, BuildContext context) async {
    String t = AppLocalizations.of(context).lang;
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/${movieId.toString()}?api_key=2f05ecb893a6f356e596873f1972d65b&language=$t');
    try {
      final response = await client.get(url);
      // throw NoInternetException('No Internet');

      return compute(parseMovieInfo, response.body);
    } on SocketException catch (_) {
      throw NoInternetException();
    } on HttpException {
      throw NoServiceFoundException();
    } on FormatException {
      throw InvalidFormatException();
    }
  }
}
