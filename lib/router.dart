import 'package:flutter/material.dart';
import 'package:planningpoker/views/home.screen.dart';
import 'package:planningpoker/views/settings.custom_deck.screen.dart';
import 'package:planningpoker/views/settings.screen.dart';
import 'package:planningpoker/views/splash.screen.dart';

class Routes {
  static const root = '/';
  static const home = '/home';
  static const settings = '/home/settings';
  static const settings_custom_deck = '/home/settings/customdeck';
  static const settings_info = '/home/settings/info';
  static const settings_intro = '/home/settings/intro';
}

/// Route builder.
Map<String, WidgetBuilder> getRoutes() {
  return {
    Routes.root: (context) => SplashScreen(
        // onInit: () {
        // StoreProvider.of<AppState>(context).dispatch(LoadSettingsAction());
        // StoreProvider.of<AppState>(context).dispatch(LoadRoomAction());
        // },
        ),
    Routes.home: (context) => HomeScreen(),
    Routes.settings: (context) => SettingsScreen(),
    Routes.settings_custom_deck: (context) => CustomDeckSetup(),
    // Routes.settings_info: (context) => InfoScreen(),
    // Routes.settings_intro: (context) => IntroScreen(),
  };
}
