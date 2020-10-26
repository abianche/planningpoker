// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
    uid: json['uid'] as String,
    username: json['username'] as String,
    currentCard: json['currentCard'] as String,
  );
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'currentCard': instance.currentCard,
    };
