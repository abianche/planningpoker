import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData.light().copyWith(
      toggleableActiveColor: Colors.red,
      snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(
          fontSize: 16.0,
        ),
      ),
    );

ThemeData darkTheme() => ThemeData.dark().copyWith(
      toggleableActiveColor: Colors.orange,
      snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
