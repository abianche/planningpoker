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

  Future<Settings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final darkMode = prefs.getBool(Prefs.darkMode) ?? false;
    final tapToReveal = prefs.getBool(Prefs.tapToReveal) ?? true;
    final vibration = prefs.getBool(Prefs.vibration) ?? true;
    final selectedDeck = DeckType.values[prefs.getInt(Prefs.selectedDeck) ?? 0];
    final customDeck = prefs.getStringList(Prefs.customDeck) ?? null; //CustomDeck.custom_deck_default;
    final seenIntro = prefs.getBool(Prefs.seenIntro) ?? false;

    return Settings(
      darkMode: darkMode,
      tapToReveal: tapToReveal,
      vibration: vibration,
      selectedDeck: selectedDeck,
      customDeck: customDeck,
      seenIntro: seenIntro,
    );
  }
}
