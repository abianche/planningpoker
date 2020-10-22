import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:planningpoker/models/deck.model.dart';

part 'settings.model.g.dart';

@JsonSerializable()
class Settings {
  final bool darkTheme;
  final bool tapToReveal;
  final double eggTimer;
  final bool vibration;
  final DeckType selectedDeck;
  final List<String> customDeck;
  final bool seenIntro;

  const Settings({
    this.darkTheme,
    this.tapToReveal,
    this.eggTimer,
    this.vibration,
    this.selectedDeck,
    this.customDeck,
    this.seenIntro,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  Settings.initialState()
      : darkTheme = false,
        tapToReveal = true,
        eggTimer = 5.0,
        vibration = true,
        selectedDeck = DeckType.standard,
        customDeck = null,
        seenIntro = false;

  Settings copyWith({
    bool darkTheme,
    bool tapToReveal,
    double eggTimer,
    bool vibration,
    DeckType selectedDeck,
    List<String> customDeck,
    bool seenIntro,
  }) {
    return Settings(
      darkTheme: darkTheme ?? this.darkTheme,
      tapToReveal: tapToReveal ?? this.tapToReveal,
      eggTimer: eggTimer ?? this.eggTimer,
      vibration: vibration ?? this.vibration,
      selectedDeck: selectedDeck ?? this.selectedDeck,
      customDeck: customDeck ?? this.customDeck,
      seenIntro: seenIntro ?? this.seenIntro,
    );
  }

  @override
  String toString() {
    return 'Settings(darkTheme: $darkTheme, tapToReveal: $tapToReveal, eggTimer: $eggTimer, vibration: $vibration, selectedDeck: $selectedDeck, customDeck: $customDeck, seenIntro: $seenIntro)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Settings &&
        o.darkTheme == darkTheme &&
        o.tapToReveal == tapToReveal &&
        o.eggTimer == eggTimer &&
        o.vibration == vibration &&
        o.selectedDeck == selectedDeck &&
        listEquals(o.customDeck, customDeck) &&
        o.seenIntro == seenIntro;
  }

  @override
  int get hashCode {
    return darkTheme.hashCode ^
        tapToReveal.hashCode ^
        eggTimer.hashCode ^
        vibration.hashCode ^
        selectedDeck.hashCode ^
        customDeck.hashCode ^
        seenIntro.hashCode;
  }
}
