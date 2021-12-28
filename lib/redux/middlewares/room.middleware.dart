import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/repository.dart';
import 'package:planningpoker/services/firestore.service.dart';
import 'package:redux/redux.dart';

/// Save room middleware which perists the room to the [Repository].
Middleware<AppState> createSaveRoom(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveRoom(roomSelector(store.state));
  };
}

/// Load room middleware which restores the room from the [Repository].
Middleware<AppState> createLoadRoom(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    final room = await repository.loadRoom();
    if (room.uid.isNotEmpty && room.name.isNotEmpty) {
      // get uptodate data
      final remoteRoom = await FirestoreService().roomExists(room.name);

      store.dispatch(SetRoomAction(
        room: room.copyWith(
          uid: remoteRoom.uid,
          name: remoteRoom.name,
          owner: remoteRoom.owner,
        ),
      ));
    }

    next(action);
  };
}
