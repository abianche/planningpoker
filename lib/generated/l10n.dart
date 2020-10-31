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

  /// `Deck`
  String get deck {
    return Intl.message(
      'Deck',
      name: 'deck',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get room {
    return Intl.message(
      'Room',
      name: 'room',
      desc: '',
      args: [],
    );
  }

  /// `The configuration has been saved!`
  String get customDeckSaveMessage {
    return Intl.message(
      'The configuration has been saved!',
      name: 'customDeckSaveMessage',
      desc: '',
      args: [],
    );
  }

  /// `The configuration has been restored!`
  String get customDeckRestoreMessage {
    return Intl.message(
      'The configuration has been restored!',
      name: 'customDeckRestoreMessage',
      desc: '',
      args: [],
    );
  }

  /// `Custom deck setup`
  String get customDeckSetup {
    return Intl.message(
      'Custom deck setup',
      name: 'customDeckSetup',
      desc: '',
      args: [],
    );
  }

  /// `Save the configuration`
  String get customDeckSaveTooltip {
    return Intl.message(
      'Save the configuration',
      name: 'customDeckSaveTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Reset the configuration`
  String get customDeckRestoreTooltip {
    return Intl.message(
      'Reset the configuration',
      name: 'customDeckRestoreTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Open room`
  String get openRoom {
    return Intl.message(
      'Open room',
      name: 'openRoom',
      desc: '',
      args: [],
    );
  }

  /// `Show the intro slides again.`
  String get showTheIntroInfo {
    return Intl.message(
      'Show the intro slides again.',
      name: 'showTheIntroInfo',
      desc: '',
      args: [],
    );
  }

  /// `{deckName} deck`
  String deckName(Object deckName) {
    return Intl.message(
      '$deckName deck',
      name: 'deckName',
      desc: '',
      args: [deckName],
    );
  }

  /// `Join or create a room`
  String get joinARoom {
    return Intl.message(
      'Join or create a room',
      name: 'joinARoom',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Ops!`
  String get ops {
    return Intl.message(
      'Ops!',
      name: 'ops',
      desc: '',
      args: [],
    );
  }

  /// `Player {username} already exists in room {room}!`
  String playerAlreadyExistsInRoom(Object username, Object room) {
    return Intl.message(
      'Player $username already exists in room $room!',
      name: 'playerAlreadyExistsInRoom',
      desc: '',
      args: [username, room],
    );
  }

  /// `Enter room name!`
  String get enterRoomName {
    return Intl.message(
      'Enter room name!',
      name: 'enterRoomName',
      desc: '',
      args: [],
    );
  }

  /// `Room name is too long!`
  String get roomNameIsTooLong {
    return Intl.message(
      'Room name is too long!',
      name: 'roomNameIsTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Enter player name!`
  String get enterPlayerName {
    return Intl.message(
      'Enter player name!',
      name: 'enterPlayerName',
      desc: '',
      args: [],
    );
  }

  /// `Player name is too long!`
  String get playerNameIsTooLong {
    return Intl.message(
      'Player name is too long!',
      name: 'playerNameIsTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Player name`
  String get playerName {
    return Intl.message(
      'Player name',
      name: 'playerName',
      desc: '',
      args: [],
    );
  }

  /// `Room name`
  String get roomName {
    return Intl.message(
      'Room name',
      name: 'roomName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
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