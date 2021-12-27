// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => Settings(
      themeMode: $enumDecode(_$ThemeModeEnumMap, json['themeMode']),
      tapToReveal: json['tapToReveal'] as bool,
      vibration: json['vibration'] as bool,
      selectedDeck: $enumDecode(_$DeckTypeEnumMap, json['selectedDeck']),
      customDeck: (json['customDeck'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      seenIntro: json['seenIntro'] as bool,
    );

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
      'tapToReveal': instance.tapToReveal,
      'vibration': instance.vibration,
      'selectedDeck': _$DeckTypeEnumMap[instance.selectedDeck],
      'customDeck': instance.customDeck,
      'seenIntro': instance.seenIntro,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$DeckTypeEnumMap = {
  DeckType.standard: 'standard',
  DeckType.tshirt: 'tshirt',
  DeckType.fibonacci: 'fibonacci',
  DeckType.risk: 'risk',
  DeckType.custom: 'custom',
};
