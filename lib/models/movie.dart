import 'dart:convert';

import 'package:flutter_movie/utils/constants.dart';

class Movie {
  String title;
  String releaseDate;
  String posterPath;
  double vote;
  int id;

  Movie(
      {required this.title,
      required this.posterPath,
      required this.releaseDate,
      required this.vote,
      required this.id});

  String get fullImageUrl => '$imageBaseUrl$posterPath';

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'vote_average': vote,
      'id': id
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      vote: json['vote_average'].toDouble() ?? 0.0,
      id: json['id'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
