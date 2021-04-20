import 'package:planningpoker/redux/actions/recentRoom.action.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/repository.dart';
import 'package:redux/redux.dart';

/// Save recent rooms middleware which perists the recent rooms to the [Repository].
Middleware<AppState> createSaveRecentRooms(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveRecentRooms(recentRoomsSelector(store.state));
  };
}

/// Load recent rooms middleware which restores the recent rooms from the [Repository].
Middleware<AppState> createLoadRecentRooms(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadRecentRooms().then((loadedRecentRooms) {
      store.dispatch(SetRecentRooms(recentRooms: loadedRecentRooms));
    });

    next(action);
  };
}
