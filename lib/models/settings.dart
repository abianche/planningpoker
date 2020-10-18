import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planningpoker/models/deck.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
abstract class Settings with _$Settings {
  factory Settings({
    final bool darkTheme,
    final bool tapToReveal,
    final double eggTimer,
    final bool vibration,
    final DeckType selectedDeck,
    final List<String> customDeck,
    final bool seenIntro,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);
}
