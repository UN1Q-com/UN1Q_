import 'package:flutter/cupertino.dart';
import 'package:un1que_new/app_localization.dart';

extension GlobalExtension on BuildContext {
  ///localisation
  String translate(String target) =>
      AppLocalizations.of(this)!.translate(target)!;
}
