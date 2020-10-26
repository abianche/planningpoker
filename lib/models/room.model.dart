import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:planningpoker/models/player.model.dart';

part 'room.model.g.dart';

@JsonSerializable()

/// Model representing a given room state fetched from the server. This is also the room to which the player is part of currently.
class Room {
  final String uid;
  final String name;
  final List<Player> players;

  Room({
    this.uid,
    this.name,
    this.players,
  });

  Room copyWith({
    String uid,
    String name,
    List<Player> players,
  }) {
    return Room(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      players: players ?? this.players,
    );
  }

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);

  Room.initialState()
      : uid = null,
        name = null,
        players = [];

  @override
  String toString() => 'Room(uid: $uid, name: $name, players: $players)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Room && o.uid == uid && o.name == name && listEquals(o.players, players);
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ players.hashCode;
}
