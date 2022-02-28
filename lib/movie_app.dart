import 'package:flutter/material.dart';
import 'package:flutter_movie/models/sorting_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'ui/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateTitle: (context) {
          var t = AppLocalizations.of(context);
          return t.appTitle;
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) {
            return ChangeNotifierProvider<SortingState>(
              create: (context) => SortingState(),
              child: MyHomePage(title: AppLocalizations.of(context).appTitle),
            );
          }
        });
  }
}
