import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:redux/redux.dart';

final playerReducer = combineReducers<Player>([
  TypedReducer<Player, SetPlayerAction>(_setPlayer),
  TypedReducer<Player, ResetPlayerAction>(_resetPlayer),
]);

Player _setPlayer(Player player, SetPlayerAction action) {
  return player.copyWith(
    uid: action.player.uid,
    username: action.player.username,
    currentCard: action.player.currentCard,
  );
}

Player _resetPlayer(Player player, ResetPlayerAction action) {
  return Player.initialState();
}
