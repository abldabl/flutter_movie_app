import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_movie/utils/exceptions.dart';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieRepository {
  List<Movie> parseMovies(String body) {
    var parsed = jsonDecode(body).cast<String, dynamic>();
    return parsed['results']
        .map<Movie>((movieData) => Movie.fromJson(movieData))
        .toList(growable: false);
  }

  Future<List<Movie>> getMovies(
      http.Client client, BuildContext context) async {
    String t = AppLocalizations.of(context).lang;

    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=2f05ecb893a6f356e596873f1972d65b&language=$t');

    try {
      final response = await client.get(url);

      if (200 == response.statusCode) {
        return compute(parseMovies, response.body);
        // throw NoInternetException('No Internet');
      } else {
        return <Movie>[];
      }
    } on SocketException catch (_) {
      throw NoInternetException();
    } on HttpException {
      throw NoServiceFoundException();
    } on FormatException {
      throw InvalidFormatException();
    }
  }
}
