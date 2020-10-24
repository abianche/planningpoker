// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class L {
  L();
  
  static L current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<L> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      L.current = L();
      
      return L.current;
    });
  } 

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L);
  }

  /// `Hello, world!`
  String get greeting {
    return Intl.message(
      'Hello, world!',
      name: 'greeting',
      desc: '',
      args: [],
    );
  }

  /// `Planning Poker Online`
  String get title {
    return Intl.message(
      'Planning Poker Online',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Select deck`
  String get selectDeck {
    return Intl.message(
      'Select deck',
      name: 'selectDeck',
      desc: '',
      args: [],
    );
  }

  /// `Pick from pre-configured decks or customize one`
  String get selectDeckInfo {
    return Intl.message(
      'Pick from pre-configured decks or customize one',
      name: 'selectDeckInfo',
      desc: '',
      args: [],
    );
  }

  /// `Tap to reveal`
  String get tapToReveal {
    return Intl.message(
      'Tap to reveal',
      name: 'tapToReveal',
      desc: '',
      args: [],
    );
  }

  /// `The picked card require an extra tap to be revelead`
  String get tapToRevealInfo {
    return Intl.message(
      'The picked card require an extra tap to be revelead',
      name: 'tapToRevealInfo',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get darkMode {
    return Intl.message(
      'Dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Enable dark mode`
  String get darkModeInfo {
    return Intl.message(
      'Enable dark mode',
      name: 'darkModeInfo',
      desc: '',
      args: [],
    );
  }

  /// `Vibration`
  String get vibration {
    return Intl.message(
      'Vibration',
      name: 'vibration',
      desc: '',
      args: [],
    );
  }

  /// `Enable vibration`
  String get vibrationInfo {
    return Intl.message(
      'Enable vibration',
      name: 'vibrationInfo',
      desc: '',
      args: [],
    );
  }

  /// `What is Planning Poker ®?`
  String get whatIsPlanningPoker {
    return Intl.message(
      'What is Planning Poker ®?',
      name: 'whatIsPlanningPoker',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Page not found`
  String get pageNotFound {
    return Intl.message(
      'Page not found',
      name: 'pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Show the intro`
  String get showTheIntro {
    return Intl.message(
      'Show the intro',
      name: 'showTheIntro',
      desc: '',
      args: [],
    );
  }

  /// `Rate this app!`
  String get rateThisApp {
    return Intl.message(
      'Rate this app!',
      name: 'rateThisApp',
      desc: '',
      args: [],
    );
  }

  /// `Take a moment to rate this app! It means a lot!`
  String get rateThisAppInfo {
    return Intl.message(
      'Take a moment to rate this app! It means a lot!',
      name: 'rateThisAppInfo',
      desc: '',
      args: [],
    );
  }

  /// `Share this app!`
  String get shareThisApp {
    return Intl.message(
      'Share this app!',
      name: 'shareThisApp',
      desc: '',
      args: [],
    );
  }

  /// `Share this app with your colleagues!`
  String get shareThisAppInfo {
    return Intl.message(
      'Share this app with your colleagues!',
      name: 'shareThisAppInfo',
      desc: '',
      args: [],
    );
  }

  /// `Follow me!`
  String get followMe {
    return Intl.message(
      'Follow me!',
      name: 'followMe',
      desc: '',
      args: [],
    );
  }

  /// `Head over to my profile page, follow and support me!`
  String get followMeInfo {
    return Intl.message(
      'Head over to my profile page, follow and support me!',
      name: 'followMeInfo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'it'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L> load(Locale locale) => L.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}