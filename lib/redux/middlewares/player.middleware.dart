import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/services/firestore.service.dart';
import 'package:redux/redux.dart';

Middleware<AppState> createUpdatePlayerStatusMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    final Room room = roomSelector(store.state);
    if (room.uid == null) return;

    final Player player = playerSelector(store.state);
    FirestoreService().updatePlayerStatus(room.uid, player);
  };
}
