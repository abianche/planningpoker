import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:redux/redux.dart';

final playerReducer = combineReducers<Player>([
  TypedReducer<Player, SetPlayerAction>(_setPlayer),
]);

Player _setPlayer(Player player, SetPlayerAction action) {
  return player.copyWith(
    uid: action.player.uid,
    username: action.player.username,
    currentCard: action.player.currentCard,
  );
}
