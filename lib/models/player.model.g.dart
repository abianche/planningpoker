// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      username: json['username'] as String,
      currentCard: json['currentCard'] as String,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'username': instance.username,
      'currentCard': instance.currentCard,
    };
