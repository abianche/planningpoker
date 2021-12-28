import 'package:json_annotation/json_annotation.dart';

part 'room.model.g.dart';

@JsonSerializable()

/// Model representing a given room state fetched from the server. This is also the room to which the player is part of currently.
class Room {
  final String uid;
  final String name;
  final String owner;

  Room({
    required this.uid,
    required this.name,
    required this.owner,
  });

  Room copyWith({
    String? uid,
    String? name,
    String? owner,
  }) {
    return Room(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      owner: owner ?? this.owner,
    );
  }

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);

  Room.initialState()
      : uid = '',
        name = '',
        owner = '';

  @override
  String toString() => 'Room(uid: $uid, name: $name, owner: $owner)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Room && other.uid == uid && other.name == name && other.owner == owner;
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ owner.hashCode;
}
