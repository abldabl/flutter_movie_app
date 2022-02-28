import 'package:flutter/material.dart';
import 'package:flutter_movie/models/movie_info_refresh.dart';
import 'package:flutter_movie/ui/screens/movie_info_screen.dart';
import 'package:flutter_movie/utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  final int id;
  final String posterPath;
  final String title;
  final String releaseDate;
  final double vote;
  const MovieCard(
      {Key? key,
      required this.posterPath,
      required this.title,
      required this.releaseDate,
      required this.vote,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider<MovieInfoRefresh>(
                  create: (context) => MovieInfoRefresh(refresh: 'refresh'),
                  child: MovieInfoScreen(
                    movieId: id,
                  )),
            ));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              child: Container(
                height: 130.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: movieCardGradient,
                ),
              ),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    color: circleWidgetColor, shape: BoxShape.circle),
                child: CircularPercentIndicator(
                  backgroundColor: Colors.transparent,
                  radius: 16.0,
                  lineWidth: 3.0,
                  percent: vote / 10,
                  center: Text(
                    vote.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  progressColor: Colors.white,
                ),
              ),
            ),
            Ink.image(
              image: NetworkImage('$imageBaseUrl$posterPath'),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    releaseDate,
                    style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xBFffffff)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
