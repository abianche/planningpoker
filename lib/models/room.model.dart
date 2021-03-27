import 'package:json_annotation/json_annotation.dart';

part 'room.model.g.dart';

@JsonSerializable()

/// Model representing a given room state fetched from the server. This is also the room to which the player is part of currently.
class Room {
  final String uid;
  final String name;

  Room({
    required this.uid,
    required this.name,
  });

  Room copyWith({
    String? uid,
    String? name,
  }) {
    return Room(
      uid: uid ?? this.uid,
      name: name ?? this.name,
    );
  }

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);

  Room.initialState()
      : uid = '',
        name = '';

  @override
  String toString() => 'Room(uid: $uid, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Room && o.uid == uid && o.name == name;
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode;
}
