import 'package:flutter/material.dart';

import 'package:flutter_movie/models/sorting_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DropDown extends StatelessWidget {
  SortingState state;
  SortingState sortingState;
  List<String> sortingStates;
  DropDown({
    Key? key,
    required this.state,
    required this.sortingState,
    required this.sortingStates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    DropdownMenuItem<String> buildSortingItem(item) => DropdownMenuItem(
        value: item,
        child: Text(
          item == 'byName'
              ? t.byName
              : item == 'byDate'
                  ? t.byDate
                  : t.byVote,
        ));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey[850], borderRadius: BorderRadius.circular(20)),
      child: DropdownButton<String>(
        value: state.currentStateForDropDown,
        items: sortingStates.map(buildSortingItem).toList(),
        onChanged: (val) => sortingState.changeState(val),
        icon: const Icon(Icons.swap_vert),
        iconSize: 26,
        iconEnabledColor: Colors.white,
        underline: const SizedBox(),
      ),
    );
  }
}
