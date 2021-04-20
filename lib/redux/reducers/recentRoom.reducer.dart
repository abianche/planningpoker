import "package:fast_immutable_collections/fast_immutable_collections.dart";
import 'package:planningpoker/redux/actions/recentRoom.action.dart';
import 'package:redux/redux.dart';

final recentRoomsReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, AddRecentRoom>(_addRecentRoom),
  TypedReducer<List<String>, SetRecentRooms>(_setRecentRooms),
]);

List<String> _addRecentRoom(List<String> recentRooms, AddRecentRoom action) {
  List<String> newRecentRooms = List.from(recentRooms);
  newRecentRooms.insert(0, action.room.name);
  newRecentRooms = newRecentRooms.distinct();
  return newRecentRooms.take(5).toList();
}

List<String> _setRecentRooms(List<String> recentRooms, SetRecentRooms action) {
  return action.recentRooms;
}
