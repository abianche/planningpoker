import 'package:flutter/material.dart';

ThemeData getTheme(BuildContext context, bool darkMode) {
  return darkMode
      ? ThemeData.dark().copyWith(
          toggleableActiveColor: Colors.orange,
        )
      : ThemeData.light().copyWith(
          toggleableActiveColor: Colors.red,
        );
}
