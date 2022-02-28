import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/widgets/dropdown.dart';
import 'package:flutter_movie/utils/constants.dart';
import 'package:provider/provider.dart';

import 'package:flutter_movie/models/sorting_state.dart';
import 'package:flutter_movie/ui/widgets/movie_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatelessWidget {
  String title;
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  static const sortingStates = ['byName', 'byDate', 'byVote'];
  static String currentSortingStateValue = 'byVote';

  @override
  Widget build(BuildContext context) {
    final sortingState = Provider.of<SortingState>(context, listen: false);
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Consumer<SortingState>(
                      builder: (_, state, __) => DropDown(
                          state: state,
                          sortingState: sortingState,
                          sortingStates: MyHomePage.sortingStates)),
                ],
              ),
            ),
            Consumer<SortingState>(
              builder: (_, state, __) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
                  child: RefreshIndicator(
                      onRefresh: () async {
                        sortingState.changeState(currentSortingStateValue);
                      },
                      child: MoviesList(sortingState: state.state)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
