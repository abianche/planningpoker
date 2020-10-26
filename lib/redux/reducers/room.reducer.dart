import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:redux/redux.dart';

final roomReducer = combineReducers<Room>([
  TypedReducer<Room, SetRoomAction>(_setRoom),
]);

Room _setRoom(Room room, SetRoomAction action) {
  return room.copyWith(
    uid: action.room.uid,
    name: action.room.name,
    players: action.room.players,
  );
}
