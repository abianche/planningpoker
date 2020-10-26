import 'package:flutter/material.dart';

ThemeData getTheme(BuildContext context, bool darkMode) {
  return darkMode
      ? ThemeData.dark().copyWith(
          toggleableActiveColor: Colors.orange,
          snackBarTheme: const SnackBarThemeData(
            contentTextStyle: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        )
      : ThemeData.light().copyWith(
          toggleableActiveColor: Colors.red,
          snackBarTheme: const SnackBarThemeData(
            contentTextStyle: TextStyle(
              fontSize: 16.0,
            ),
          ),
        );
}
