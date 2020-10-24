// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return Settings(
    darkMode: json['darkMode'] as bool,
    tapToReveal: json['tapToReveal'] as bool,
    vibration: json['vibration'] as bool,
    selectedDeck: _$enumDecodeNullable(_$DeckTypeEnumMap, json['selectedDeck']),
    customDeck: (json['customDeck'] as List)?.map((e) => e as String)?.toList(),
    seenIntro: json['seenIntro'] as bool,
  );
}

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'darkMode': instance.darkMode,
      'tapToReveal': instance.tapToReveal,
      'vibration': instance.vibration,
      'selectedDeck': _$DeckTypeEnumMap[instance.selectedDeck],
      'customDeck': instance.customDeck,
      'seenIntro': instance.seenIntro,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$DeckTypeEnumMap = {
  DeckType.standard: 'standard',
  DeckType.tshirt: 'tshirt',
  DeckType.fibonacci: 'fibonacci',
  DeckType.risk: 'risk',
  DeckType.custom: 'custom',
};
