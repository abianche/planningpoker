import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/repository.dart';
import 'package:planningpoker/services/firestore.service.dart';
import 'package:redux/redux.dart';

Middleware<AppState> createUpdatePlayerStatusMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    final Room room = roomSelector(store.state);
    if (room.uid.isEmpty) return;

    final Player player = playerSelector(store.state);
    FirestoreService().updatePlayerStatus(room.uid, player);
  };
}

/// Save player middleware which perists the player to the [Repository].
Middleware<AppState> createSavePlayer(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.savePlayer(playerSelector(store.state));
  };
}

/// Load player middleware which restores the player from the [Repository].
Middleware<AppState> createLoadPlayer(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPlayer().then((loadedPlayer) {
      store.dispatch(SetPlayerAction(player: loadedPlayer));
    });

    next(action);
  };
}
