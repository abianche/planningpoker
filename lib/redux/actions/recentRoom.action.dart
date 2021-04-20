import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';

class AddRecentRoom {
  final Room room;

  AddRecentRoom({
    required this.room,
  });

  @override
  String toString() => 'AddRecentRoom(room: $room)';
}

class SetRecentRooms {
  final List<String> recentRooms;

  SetRecentRooms({
    required this.recentRooms,
  });

  @override
  String toString() => 'SetRecentRooms(recentRooms: $recentRooms)';
}
