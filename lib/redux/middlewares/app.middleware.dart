import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/actions/recentRoom.action.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:planningpoker/redux/actions/settings.actions.dart';
import 'package:planningpoker/redux/middlewares/logger.middleware.dart';
import 'package:planningpoker/redux/middlewares/player.middleware.dart';
import 'package:planningpoker/redux/middlewares/recentRooms.middleware.dart';
import 'package:planningpoker/redux/middlewares/room.middleware.dart';
import 'package:planningpoker/redux/middlewares/settings.middleware.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/repository.dart';
import 'package:redux/redux.dart';

/// Returns all the app middlewares to be used in the [Store] declaration.
List<Middleware<AppState>> createAppMiddleware(
  Repository repository,
) {
  final saveSettings = createSaveSettings(repository);
  final loadSettings = createLoadSettings(repository);

  final saveRoom = createSaveRoom(repository);
  final loadRoom = createLoadRoom(repository);
  final saveRecentRooms = createSaveRecentRooms(repository);
  final loadRecentRooms = createLoadRecentRooms(repository);

  final savePlayer = createSavePlayer(repository);
  final loadPlayer = createLoadPlayer(repository);
  final updatePlayer = createUpdatePlayerStatusMiddleware();
  final clearAllPlayerCards = createClearAllPlayerCards();

  final resetRoomAndPlayer = createResetRoomAndPlayer(repository);

  return [
    createLoggerMiddleware(),
    TypedMiddleware<AppState, SetSettingsAction>(saveSettings),
    TypedMiddleware<AppState, ClearSettingsAction>(saveSettings),
    TypedMiddleware<AppState, LoadSettingsAction>(loadSettings),
    TypedMiddleware<AppState, LoadSettingsAction>(loadRecentRooms),
    TypedMiddleware<AppState, SetRoomAction>(saveRoom),
    TypedMiddleware<AppState, AddRecentRoom>(saveRecentRooms),
    TypedMiddleware<AppState, ResetRoomAction>(resetRoomAndPlayer),
    TypedMiddleware<AppState, LoadRoomAction>(loadRoom),
    TypedMiddleware<AppState, SetPlayerAction>(updatePlayer),
    TypedMiddleware<AppState, SetPlayerAction>(savePlayer),
    TypedMiddleware<AppState, ResetPlayerAction>(resetRoomAndPlayer),
    TypedMiddleware<AppState, LoadPlayerAction>(loadPlayer),
    TypedMiddleware<AppState, ClearAllPlayerCardsAction>(clearAllPlayerCards),
  ];
}

Middleware<AppState> createResetRoomAndPlayer(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.resetRoomAndPlayer();
  };
}
