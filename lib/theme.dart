import 'package:flutter/cupertino.dart';
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

CupertinoThemeData cupertinoTheme() => const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        navTitleTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      primaryColor: Colors.white,
    );
