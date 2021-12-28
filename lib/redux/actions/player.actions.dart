import 'package:planningpoker/models/player.model.dart';

class SetPlayerAction {
  final Player player;

  SetPlayerAction({
    required this.player,
  });

  @override
  String toString() => 'SetPlayerAction(player: $player)';
}

class ResetPlayerAction {}

class LoadPlayerAction {}

class ClearAllPlayerCardsAction {}
