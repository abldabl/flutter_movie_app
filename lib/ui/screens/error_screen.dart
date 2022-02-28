import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  String errorMeassage;
  ErrorScreen({
    Key? key,
    required this.errorMeassage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 1, children: [
      Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            errorMeassage,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                decoration: TextDecoration.none),
          )
        ],
      )),
    ]);
  }
}
