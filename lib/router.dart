import 'package:flutter/material.dart';
import 'package:planningpoker/logger.dart';
import 'package:planningpoker/views/404.screen.dart';
import 'package:planningpoker/views/home.screen.dart';
import 'package:planningpoker/views/info.screen.dart';
import 'package:planningpoker/views/intro.screen.dart';
import 'package:planningpoker/views/settings.custom_deck.screen.dart';
import 'package:planningpoker/views/settings.screen.dart';
import 'package:planningpoker/views/splash.screen.dart';

final logger = getLogger('Routes');

class Routes {
  static const root = '/';
  static const home = '/home';
  static const join = '/join';
  static const intro = '/intro';
  static const settings = '/home/settings';
  static const settings_custom_deck = '/home/settings/customdeck';
  static const settings_info = '/home/settings/info';
  static const settings_intro = '/home/settings/intro';

  /// Route builder.
  static Route generateRoute(RouteSettings settings) {
    logger.v('generateRoute | name: ${settings.name} arguments: ${settings.arguments}');

    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.intro:
        return MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      case Routes.settings_custom_deck:
        return MaterialPageRoute(
          builder: (context) => const CustomDeckSetup(),
        );
      case Routes.settings_info:
        return MaterialPageRoute(
          builder: (context) => const InfoScreen(),
        );
      case Routes.settings_intro:
        return MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        );
      case Routes.join:
        {
          return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          );
        }
      default:
        final queryParameters = Uri.splitQueryString(settings.name!);
        logger.d(queryParameters);
        return MaterialPageRoute(
          builder: (context) => NotFoundScreen(name: settings.name),
        );
    }
  }
}
