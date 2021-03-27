import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:planningpoker/data/decks.dart';
import 'package:planningpoker/models/deck.model.dart';

part 'settings.model.g.dart';

@JsonSerializable()

/// Settings model for the application.
class Settings {
  /// Set theme mode.
  final ThemeMode themeMode;

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
    required this.themeMode,
    required this.tapToReveal,
    required this.vibration,
    required this.selectedDeck,
    required this.customDeck,
    required this.seenIntro,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  /// Creates the initial state of the settings
  Settings.initialState()
      : themeMode = ThemeMode.system,
        tapToReveal = true,
        vibration = true,
        selectedDeck = DeckType.standard,
        customDeck = custom_deck.deckValues,
        seenIntro = false;

  Settings copyWith({
    ThemeMode? themeMode,
    bool? tapToReveal,
    bool? vibration,
    DeckType? selectedDeck,
    List<String>? customDeck,
    bool? seenIntro,
  }) {
    return Settings(
      themeMode: themeMode ?? this.themeMode,
      tapToReveal: tapToReveal ?? this.tapToReveal,
      vibration: vibration ?? this.vibration,
      selectedDeck: selectedDeck ?? this.selectedDeck,
      customDeck: customDeck ?? this.customDeck,
      seenIntro: seenIntro ?? this.seenIntro,
    );
  }

  @override
  String toString() {
    return 'Settings(themeMode: $themeMode, tapToReveal: $tapToReveal, vibration: $vibration, selectedDeck: $selectedDeck, customDeck: $customDeck, seenIntro: $seenIntro)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Settings &&
        o.themeMode == themeMode &&
        o.tapToReveal == tapToReveal &&
        o.vibration == vibration &&
        o.selectedDeck == selectedDeck &&
        listEquals(o.customDeck, customDeck) &&
        o.seenIntro == seenIntro;
  }

  @override
  int get hashCode {
    return themeMode.hashCode ^
        tapToReveal.hashCode ^
        vibration.hashCode ^
        selectedDeck.hashCode ^
        customDeck.hashCode ^
        seenIntro.hashCode;
  }
}
