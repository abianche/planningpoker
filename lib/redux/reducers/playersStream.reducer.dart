import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:planningpoker/services/firestore.service.dart';
import 'package:redux/redux.dart';

final playersStreamReducer = combineReducers<Stream<QuerySnapshot>>([
  TypedReducer<Stream<QuerySnapshot>, SetRoomAction>(_setPlayersStream),
  TypedReducer<Stream<QuerySnapshot>, ResetRoomAction>(_resetPlayersStream),
]);

Stream<QuerySnapshot> _setPlayersStream(Stream<QuerySnapshot> playersStream, SetRoomAction action) {
  return FirestoreService().getPlayersStream(action.room.uid);
}

Stream<QuerySnapshot> _resetPlayersStream(Stream<QuerySnapshot> playersStream, ResetRoomAction action) {
  return const Stream<QuerySnapshot>.empty();
}
