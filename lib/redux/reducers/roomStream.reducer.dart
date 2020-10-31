import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:redux/redux.dart';

final roomStreamReducer = combineReducers<Stream<DocumentSnapshot>>([
  TypedReducer<Stream<DocumentSnapshot>, SetRoomAction>(_setRoomStream),
  TypedReducer<Stream<DocumentSnapshot>, ResetRoomAction>(_resetRoomStream),
]);

Stream<DocumentSnapshot> _setRoomStream(Stream<DocumentSnapshot> roomStream, SetRoomAction action) {
  return FirebaseFirestore.instance.collection('rooms').doc(action.room.uid).snapshots();
}

Stream<DocumentSnapshot> _resetRoomStream(Stream<DocumentSnapshot> roomStream, ResetRoomAction action) {
  return null;
}
