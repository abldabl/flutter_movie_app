import 'package:flutter/material.dart';

const mainColor = Color(0xFF15141F);
const circleWidgetColor = Color(0xAA15141f);

const imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

const movieCardGradient = LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    stops: [
      0,
      1
    ],
    colors: [
      Color(0x11000000),
      Color(0xFF000000),
    ]);
const movieInfoCardGradient = LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    stops: [
      0.0,
      1
    ],
    colors: [
      Color(0xBB15141F),
      mainColor,
    ]);

const arrowBack = Icon(Icons.chevron_left, size: 40, color: Colors.white);

const text18 = TextStyle(fontSize: 18);
