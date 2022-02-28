import 'dart:convert';

import 'package:flutter_movie/models/genre.dart';
import 'package:flutter_movie/utils/constants.dart';

class MovieInfo {
  final int id;
  final String name;
  final String backdropPath;
  final String posterPath;
  final String overview;
  final double vote;
  final String releaseDate;
  final List<Genre> genres;
  final int budget;
  final int revenue;
  final int runtime;
  final bool adult;
  MovieInfo({
    required this.id,
    required this.name,
    required this.backdropPath,
    required this.posterPath,
    required this.overview,
    required this.vote,
    required this.releaseDate,
    required this.genres,
    required this.budget,
    required this.revenue,
    required this.runtime,
    required this.adult,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': name,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'overview': overview,
      'vote_average': vote,
      'release_date': releaseDate,
      'genres': genres.map((x) => x.toMap()).toList(),
      'budget': budget,
      'revenue': revenue,
      'runtime': runtime,
      'adult': adult,
    };
  }

  factory MovieInfo.fromJson(Map<String, dynamic> json) {
    return MovieInfo(
      id: json['id']?.toInt() ?? 0,
      name: json['title'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      posterPath: json['poster_path'] ?? '',
      overview: json['overview'] ?? '',
      vote: json['vote_average']?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      genres: List<Genre>.from(json['genres']?.map((x) => Genre.fromJson(x))),
      budget: json['budget']?.toInt() ?? 0,
      revenue: json['revenue']?.toInt() ?? 0,
      runtime: json['runtime']?.toInt() ?? 0,
      adult: json['adult'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  String get posterUrl => '$imageBaseUrl$posterPath';
  String get backDropUrl => '$imageBaseUrl$backdropPath';

  // Map<String, dynamic> get allProps => {
  //       'id': id.toInt(),
  //       'name': name.toString(),
  //       'backdropPath': backdropPath.toString(),
  //       'posterPath': posterPath.toString(),
  //       'overview': overview.toString(),
  //       'vote': vote.toDouble(),
  //       'adult': adult,
  //       'runtime': runtime.toInt(),
  //       'releaseDate': releaseDate.toString(),
  //       'budget': budget
  //     };
  // factory MovieInfo.fromJson(String source) =>
  //     MovieInfo.fromMap(json.decode(source));
}
