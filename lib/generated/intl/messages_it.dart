// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'it';

  static m0(deckName) => "${deckName} deck";

  static m1(username, room) => "Player ${username} already exists in room ${room}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "about" : MessageLookupByLibrary.simpleMessage("About"),
    "customDeckRestoreMessage" : MessageLookupByLibrary.simpleMessage("The configuration has been restored!"),
    "customDeckRestoreTooltip" : MessageLookupByLibrary.simpleMessage("Reset the configuration"),
    "customDeckSaveMessage" : MessageLookupByLibrary.simpleMessage("The configuration has been saved!"),
    "customDeckSaveTooltip" : MessageLookupByLibrary.simpleMessage("Save the configuration"),
    "customDeckSetup" : MessageLookupByLibrary.simpleMessage("Custom deck setup"),
    "darkMode" : MessageLookupByLibrary.simpleMessage("Dark mode"),
    "darkModeInfo" : MessageLookupByLibrary.simpleMessage("Enable dark mode"),
    "deck" : MessageLookupByLibrary.simpleMessage("Deck"),
    "deckName" : m0,
    "enterPlayerName" : MessageLookupByLibrary.simpleMessage("Enter player name!"),
    "enterRoomName" : MessageLookupByLibrary.simpleMessage("Enter room name!"),
    "error" : MessageLookupByLibrary.simpleMessage("Error"),
    "followMe" : MessageLookupByLibrary.simpleMessage("Follow me!"),
    "followMeInfo" : MessageLookupByLibrary.simpleMessage("Head over to my profile page, follow and support me!"),
    "greeting" : MessageLookupByLibrary.simpleMessage("Ciao, mondo!"),
    "instructions" : MessageLookupByLibrary.simpleMessage("Instructions"),
    "joinARoom" : MessageLookupByLibrary.simpleMessage("Join a room"),
    "loading" : MessageLookupByLibrary.simpleMessage("Loading"),
    "logout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "openRoom" : MessageLookupByLibrary.simpleMessage("Open room"),
    "ops" : MessageLookupByLibrary.simpleMessage("Ops!"),
    "pageNotFound" : MessageLookupByLibrary.simpleMessage("Page not found"),
    "playerAlreadyExistsInRoom" : m1,
    "playerName" : MessageLookupByLibrary.simpleMessage("Player name"),
    "playerNameIsTooLong" : MessageLookupByLibrary.simpleMessage("Player name is too long!"),
    "rateThisApp" : MessageLookupByLibrary.simpleMessage("Rate this app!"),
    "rateThisAppInfo" : MessageLookupByLibrary.simpleMessage("Take a moment to rate this app! It means a lot!"),
    "room" : MessageLookupByLibrary.simpleMessage("Room"),
    "roomName" : MessageLookupByLibrary.simpleMessage("Room name"),
    "roomNameIsTooLong" : MessageLookupByLibrary.simpleMessage("Room name is too long!"),
    "selectDeck" : MessageLookupByLibrary.simpleMessage("Select deck"),
    "selectDeckInfo" : MessageLookupByLibrary.simpleMessage("Pick from pre-configured decks or customize one"),
    "shareThisApp" : MessageLookupByLibrary.simpleMessage("Share this app!"),
    "shareThisAppInfo" : MessageLookupByLibrary.simpleMessage("Share this app with your colleagues!"),
    "showTheIntro" : MessageLookupByLibrary.simpleMessage("Show the intro"),
    "showTheIntroInfo" : MessageLookupByLibrary.simpleMessage("Show the intro slides again."),
    "tapToReveal" : MessageLookupByLibrary.simpleMessage("Tap to reveal"),
    "tapToRevealInfo" : MessageLookupByLibrary.simpleMessage("The picked card require an extra tap to be revelead"),
    "title" : MessageLookupByLibrary.simpleMessage("Planning Poker Online"),
    "username" : MessageLookupByLibrary.simpleMessage("Username"),
    "vibration" : MessageLookupByLibrary.simpleMessage("Vibration"),
    "vibrationInfo" : MessageLookupByLibrary.simpleMessage("Enable vibration"),
    "whatIsPlanningPoker" : MessageLookupByLibrary.simpleMessage("What is Planning Poker ®?")
  };
}
