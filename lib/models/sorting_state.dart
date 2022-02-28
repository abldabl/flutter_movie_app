import 'package:flutter/foundation.dart';
import 'package:flutter_movie/utils/enum.dart';

class SortingState with ChangeNotifier {
  SortBy state = SortBy.byVote;
  String? currentStateForDropDown = 'byVote';

  void changeState(String? newState) {
    currentStateForDropDown = newState;
    if (newState == 'byName') {
      state = SortBy.byName;
    } else if (newState == 'byDate') {
      state = SortBy.byDate;
    } else {
      state = SortBy.byVote;
    }
    notifyListeners();
  }
}
