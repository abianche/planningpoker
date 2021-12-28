// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      uid: json['uid'] as String,
      name: json['name'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'owner': instance.owner,
    };
