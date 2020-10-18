// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Settings _$_$_SettingsFromJson(Map<String, dynamic> json) {
  return _$_Settings(
    darkTheme: json['darkTheme'] as bool,
    tapToReveal: json['tapToReveal'] as bool,
    eggTimer: (json['eggTimer'] as num)?.toDouble(),
    vibration: json['vibration'] as bool,
    selectedDeck: _$enumDecodeNullable(_$DeckTypeEnumMap, json['selectedDeck']),
    customDeck: (json['customDeck'] as List)?.map((e) => e as String)?.toList(),
    seenIntro: json['seenIntro'] as bool,
  );
}

Map<String, dynamic> _$_$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      'darkTheme': instance.darkTheme,
      'tapToReveal': instance.tapToReveal,
      'eggTimer': instance.eggTimer,
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
