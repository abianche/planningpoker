import 'package:json_annotation/json_annotation.dart';

part 'player.model.g.dart';

@JsonSerializable()

/// Model representing the current player.
class Player {
  final String username;
  final String currentCard;

  Player({
    this.username,
    this.currentCard,
  });

  Player copyWith({
    String username,
    String currentCard,
  }) {
    return Player(
      username: username ?? this.username,
      currentCard: currentCard ?? this.currentCard,
    );
  }

  bool isCardConfirmed() {
    return this.currentCard != null && !this.currentCard.startsWith("_");
  }

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  Player.initialState()
      : username = null,
        currentCard = null;

  @override
  String toString() => 'Player(username: $username, currentCard: $currentCard)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Player && o.username == username && o.currentCard == currentCard;
  }

  @override
  int get hashCode => username.hashCode ^ currentCard.hashCode;
}
