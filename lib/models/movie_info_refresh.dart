import 'package:flutter/widgets.dart';

class MovieInfoRefresh with ChangeNotifier {
  String refresh;
  MovieInfoRefresh({
    required this.refresh,
  });

  void refreshState(String refresh) {
    refresh = refresh;
    notifyListeners();
  }
}
