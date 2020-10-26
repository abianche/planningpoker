import 'package:flutter/material.dart';

ThemeData getTheme(BuildContext context, bool darkMode) {
  return darkMode ? ThemeData.dark() : ThemeData.light();
}
