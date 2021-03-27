// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deck _$DeckFromJson(Map<String, dynamic> json) {
  return Deck(
    deckName: json['deckName'] as String,
    deckImage: json['deckImage'] as String,
    deckColor: json['deckColor'] as int,
    deckColorDark: json['deckColorDark'] as int,
    deckValues:
        (json['deckValues'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$DeckToJson(Deck instance) => <String, dynamic>{
      'deckName': instance.deckName,
      'deckImage': instance.deckImage,
      'deckColor': instance.deckColor,
      'deckColorDark': instance.deckColorDark,
      'deckValues': instance.deckValues,
    };
