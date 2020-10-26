import 'package:planningpoker/models/player.model.dart';

class SetPlayerAction {
  final Player player;

  SetPlayerAction({
    this.player,
  });

  @override
  String toString() => 'SetPlayerAction(player: $player)';
}
