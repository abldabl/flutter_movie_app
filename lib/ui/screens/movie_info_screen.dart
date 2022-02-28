import 'package:flutter/material.dart';
import 'package:flutter_movie/models/movie_info.dart';
import 'package:flutter_movie/models/movie_info_refresh.dart';
import 'package:flutter_movie/ui/widgets/movie_info_detail.dart';
import 'package:flutter_movie/utils/constants.dart';
import 'package:provider/provider.dart';

class MovieInfoScreen extends StatelessWidget {
  int movieId;
  MovieInfoScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final refreshState = Provider.of<MovieInfoRefresh>(context, listen: false);
    return Scaffold(
      backgroundColor: mainColor,
      body: Consumer<MovieInfoRefresh>(
        builder: (_, state, __) => RefreshIndicator(
            onRefresh: () async {
              refreshState.refreshState('refresh');
            },
            child: MovieInfoDetails(movieId: movieId)),
      ),
    );
  }
}
