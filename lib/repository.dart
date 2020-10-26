import 'package:planningpoker/models/deck.model.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const darkMode = "pp_v3_darkMode";
  static const tapToReveal = "pp_v3_tapToReveal";
  static const vibration = "pp_v3_vibration";
  static const selectedDeck = "pp_v3_selectedDeck";
  static const customDeck = "pp_v3_customDeck";
  static const seenIntro = "pp_v3_seenIntro";
}

class Repository {
  /// Save the settings to [SharedPreferences]. Only non-null settings are considered.
  Future<void> saveSettings(Settings settings) async {
    final prefs = await SharedPreferences.getInstance();

    if (settings.darkMode != null) {
      await prefs.setBool(Prefs.darkMode, settings.darkMode);
    }
    if (settings.tapToReveal != null) {
      await prefs.setBool(Prefs.tapToReveal, settings.tapToReveal);
    }
    if (settings.vibration != null) {
      await prefs.setBool(Prefs.vibration, settings.vibration);
    }
    if (settings.selectedDeck != null) {
      await prefs.setInt(Prefs.selectedDeck, settings.selectedDeck.index);
    }
    if (settings.customDeck != null) {
      await prefs.setStringList(Prefs.customDeck, settings.customDeck);
    }
    if (settings.seenIntro != null) {
      await prefs.setBool(Prefs.seenIntro, settings.seenIntro);
    }
  }

  /// Load the settings from [SharedPreferences].
  Future<Settings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final defaultSettings = Settings.initialState();

    final darkMode = prefs.getBool(Prefs.darkMode);
    final tapToReveal = prefs.getBool(Prefs.tapToReveal);
    final vibration = prefs.getBool(Prefs.vibration);
    final selectedDeckIndex = prefs.getInt(Prefs.selectedDeck);
    var selectedDeck = defaultSettings.selectedDeck;
    if (selectedDeckIndex != null && selectedDeckIndex.isBetween(0, DeckType.values.length - 1)) {
      selectedDeck = DeckType.values[selectedDeckIndex];
    }
    final customDeck = prefs.getStringList(Prefs.customDeck);
    final seenIntro = prefs.getBool(Prefs.seenIntro);

    return defaultSettings.copyWith(
      darkMode: darkMode,
      tapToReveal: tapToReveal,
      vibration: vibration,
      selectedDeck: selectedDeck,
      customDeck: customDeck,
      seenIntro: seenIntro,
    );
  }
}

/// Range method extension.
extension Range on num {
  /// Checks whether a [num] is between [from] and [to] inclusive.
  bool isBetween(num from, num to) {
    return from <= this && this <= to;
  }
}
