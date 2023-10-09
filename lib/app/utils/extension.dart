import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

extension TimeOfDayExtensions on TimeOfDay {
  String format12Hour(BuildContext context) {
    TimeOfDay time = replacing(hour: hourOfPeriod);
    MaterialLocalizations localizations = MaterialLocalizations.of(context);

    final StringBuffer buffer = StringBuffer();

    buffer
      ..write(time.format(context))
      ..write(' ')
      ..write(period == DayPeriod.am
          ? localizations.anteMeridiemAbbreviation
          : localizations.postMeridiemAbbreviation);

    return '$buffer';
  }
}

bool isDirectionRTL(BuildContext context) {
  return intl.Bidi.isRtlLanguage(context.locale.toString());
}
