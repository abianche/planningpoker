import 'package:planningpoker/models/deck.model.dart';

class SetSettingsAction {
  final bool darkTheme;
  final bool tapToReveal;
  final double eggTimer;
  final bool vibration;
  final DeckType deck;
  final List<String> customDeck;
  final bool seenIntro;

  SetSettingsAction({
    this.darkTheme,
    this.tapToReveal,
    this.eggTimer,
    this.vibration,
    this.deck,
    this.customDeck,
    this.seenIntro,
  });

  @override
  String toString() {
    return 'SetSettingsAction(darkTheme: $darkTheme, tapToReveal: $tapToReveal, eggTimer: $eggTimer, vibration: $vibration, deck: $deck, customDeck: $customDeck, seenIntro: $seenIntro)';
  }
}

class ClearSettingsAction {}

class LoadSettingsAction {}
