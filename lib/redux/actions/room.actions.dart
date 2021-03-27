import 'package:planningpoker/models/room.model.dart';

class SetRoomAction {
  final Room room;

  SetRoomAction({
    required this.room,
  });

  @override
  String toString() => 'SetRoomAction(room: $room)';
}

class ResetRoomAction {}

class LoadRoomAction {}
