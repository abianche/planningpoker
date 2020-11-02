import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/repository.dart';
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
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadRoom().then((loadedRoom) {
      store.dispatch(SetRoomAction(room: loadedRoom));
    });

    next(action);
  };
}
