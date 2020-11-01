import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:redux/redux.dart';

final playersStreamReducer = combineReducers<Stream<DocumentSnapshot>>([
  TypedReducer<Stream<DocumentSnapshot>, SetRoomAction>(_setPlayersStream),
  TypedReducer<Stream<DocumentSnapshot>, ResetRoomAction>(_resetPlayersStream),
]);

Stream<DocumentSnapshot> _setPlayersStream(Stream<DocumentSnapshot> playersStream, SetRoomAction action) {
  return FirebaseFirestore.instance.collection('rooms').doc(action.room.uid).collection('players')
}

Stream<DocumentSnapshot> _resetPlayersStream(Stream<DocumentSnapshot> playersStream, ResetRoomAction action) {
  return null;
}
