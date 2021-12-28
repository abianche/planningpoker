import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:redux/redux.dart';

final roomReducer = combineReducers<Room>([
  TypedReducer<Room, SetRoomAction>(_setRoom),
  TypedReducer<Room, ResetRoomAction>(_resetRoom),
]);

Room _setRoom(Room room, SetRoomAction action) {
  return room.copyWith(
    uid: action.room.uid,
    name: action.room.name,
    owner: action.room.owner,
  );
}

Room _resetRoom(Room room, ResetRoomAction action) {
  return Room.initialState();
}
