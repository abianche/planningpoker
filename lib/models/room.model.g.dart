// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    uid: json['uid'] as String,
    name: json['name'] as String,
    players: (json['players'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Player.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'players': instance.players,
    };
