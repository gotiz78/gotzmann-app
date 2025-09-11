import 'package:flutter/material.dart';
import 'package:gotzmann_app/theme/colors.dart';
import 'package:gotzmann_app/theme/typography.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: kAccentColor,
      brightness: Brightness.dark,
    ),
    textTheme: textTheme,
  );
}
