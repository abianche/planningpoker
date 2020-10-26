import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planningpoker/data/decks.dart';
import 'package:planningpoker/models/deck.model.dart';

part 'settings.model.g.dart';

@JsonSerializable()

/// Settings model for the application.
class Settings {
  /// Enables dark mode theme.
  final bool darkMode;

  /// Whether or not the cards need an extra tapping to be revealed.
  final bool tapToReveal;

  /// Enable the vibration.
  final bool vibration;

  /// Currently selected deck.
  final DeckType selectedDeck;

  /// Customize deck configuration.
  final List<String> customDeck;

  /// Whether or not the user has seen the intro already.
  final bool seenIntro;

  const Settings({
    this.darkMode,
    this.tapToReveal,
    this.vibration,
    this.selectedDeck,
    this.customDeck,
    this.seenIntro,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  /// Creates the initial state of the settings
  Settings.initialState()
      : darkMode = false,
        tapToReveal = true,
        vibration = true,
        selectedDeck = DeckType.standard,
        customDeck = custom_deck.deckValues,
        seenIntro = false;

  Settings copyWith({
    bool darkMode,
    bool tapToReveal,
    bool vibration,
    DeckType selectedDeck,
    List<String> customDeck,
    bool seenIntro,
  }) {
    return Settings(
      darkMode: darkMode ?? this.darkMode,
      tapToReveal: tapToReveal ?? this.tapToReveal,
      vibration: vibration ?? this.vibration,
      selectedDeck: selectedDeck ?? this.selectedDeck,
      customDeck: customDeck ?? this.customDeck,
      seenIntro: seenIntro ?? this.seenIntro,
    );
  }

  @override
  String toString() {
    return 'Settings(darkMode: $darkMode, tapToReveal: $tapToReveal, vibration: $vibration, selectedDeck: $selectedDeck, customDeck: $customDeck, seenIntro: $seenIntro)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Settings &&
        o.darkMode == darkMode &&
        o.tapToReveal == tapToReveal &&
        o.vibration == vibration &&
        o.selectedDeck == selectedDeck &&
        listEquals(o.customDeck, customDeck) &&
        o.seenIntro == seenIntro;
  }

  @override
  int get hashCode {
    return darkMode.hashCode ^
        tapToReveal.hashCode ^
        vibration.hashCode ^
        selectedDeck.hashCode ^
        customDeck.hashCode ^
        seenIntro.hashCode;
  }
}
