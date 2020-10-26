import 'package:json_annotation/json_annotation.dart';

part 'player.model.g.dart';

@JsonSerializable()

/// Model representing the current player.
class Player {
  final String uid;
  final String username;
  final String currentCard;

  Player({
    this.uid,
    this.username,
    this.currentCard,
  });

  Player copyWith({
    String uid,
    String username,
    String currentCard,
  }) {
    return Player(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      currentCard: currentCard ?? this.currentCard,
    );
  }

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  Player.initialState()
      : uid = null,
        username = null,
        currentCard = null;

  @override
  String toString() => 'Player(uid: $uid, username: $username, currentCard: $currentCard)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Player && o.uid == uid && o.username == username && o.currentCard == currentCard;
  }

  @override
  int get hashCode => uid.hashCode ^ username.hashCode ^ currentCard.hashCode;
}
