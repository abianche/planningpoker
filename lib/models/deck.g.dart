// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Deck _$_$_DeckFromJson(Map<String, dynamic> json) {
  return _$_Deck(
    name: json['name'] as String,
    image: json['image'] as String,
    color: json['color'] as String,
    colorDark: json['colorDark'] as String,
    values: (json['values'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_DeckToJson(_$_Deck instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'color': instance.color,
      'colorDark': instance.colorDark,
      'values': instance.values,
    };
