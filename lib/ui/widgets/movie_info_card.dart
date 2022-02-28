import 'package:flutter/material.dart';
import 'package:flutter_movie/utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieDetailCard extends StatelessWidget {
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final int budget;
  final double voteAverage;
  final bool adult;

  const MovieDetailCard({
    Key? key,
    required this.posterPath,
    required this.runtime,
    required this.releaseDate,
    required this.budget,
    required this.voteAverage,
    required this.adult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    int hour = runtime ~/ 60;
    int minutes = runtime % 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 15),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              child: SizedBox(
                  width: 150,
                  height: 220,
                  child: Ink.image(
                    image: NetworkImage(posterPath),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: circleWidgetColor, shape: BoxShape.circle),
                      child: CircularPercentIndicator(
                        backgroundColor: Colors.transparent,
                        radius: 17,
                        lineWidth: 3.0,
                        center: Text(adult == true ? "18+" : "+6",
                            style: const TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                          color: circleWidgetColor, shape: BoxShape.circle),
                      child: CircularPercentIndicator(
                        fillColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        radius: 17.0,
                        lineWidth: 3.0,
                        percent: voteAverage / 10,
                        center: Text('$voteAverage'),
                        progressColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(t.releaseDate, style: text18),
                  Text(releaseDate, style: text18),
                  const SizedBox(height: 10),
                  Text(
                      '${hour.toString()} ${t.hour} ${minutes.toString()} ${t.minutes}',
                      style: text18),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(t.income, style: text18),
                  Text('$budget \$', style: text18),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
