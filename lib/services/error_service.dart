import 'package:flutter_movie/ui/screens/error_screen.dart';
import 'package:flutter_movie/utils/exceptions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

errorServie(context, err) {
  if (err is NoInternetException) {
    return ErrorScreen(errorMeassage: AppLocalizations.of(context).noInternet);
    // Future.delayed(Duration.zero, () async {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>
    //           ErrorScreen(errorMeassage: noInternetException.message),
    //     ),
    //   );
    // });
  }
  if (err is NoServiceFoundException) {
    return ErrorScreen(
        errorMeassage: AppLocalizations.of(context).noServiceFound);
    // Future.delayed(Duration.zero, () async {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>
    //           ErrorScreen(errorMeassage: noServiceFoundException.message),
    //     ),
    //   );
    // });
  }
  if (err is InvalidFormatException) {
    return ErrorScreen(
        errorMeassage: AppLocalizations.of(context).invalidFormat);
    // Future.delayed(Duration.zero, () async {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>
    //           ErrorScreen(errorMeassage: invalidFormatException.message),
    //     ),
    //   );
    // });
  }
  return ErrorScreen(errorMeassage: err.toString());
}
