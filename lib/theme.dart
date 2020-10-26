import 'package:flutter/material.dart';

final lightTheme = ThemeData.light();
final darkTheme = ThemeData.dark().copyWith(
  toggleableActiveColor: Colors.red,
);

ThemeData getTheme(BuildContext context, bool darkMode) {
  return darkMode ? darkTheme : lightTheme;
}
