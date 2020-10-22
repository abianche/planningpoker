import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deck.model.g.dart';

enum DeckType { standard, tshirt, fibonacci, risk, custom }

@JsonSerializable()
class Deck {
  final String deckName;
  final String deckImage;
  final int deckColor;
  final int deckColorDark;
  final List<String> deckValues;

  const Deck({
    this.deckName,
    this.deckImage,
    this.deckColor,
    this.deckColorDark,
    this.deckValues,
  });

  factory Deck.fromJson(Map<String, dynamic> json) => _$DeckFromJson(json);

  Map<String, dynamic> toJson() => _$DeckToJson(this);

  Deck copyWith({
    String deckName,
    String deckImage,
    int deckColor,
    int deckColorDark,
    List<String> deckValues,
  }) {
    return Deck(
      deckName: deckName ?? this.deckName,
      deckImage: deckImage ?? this.deckImage,
      deckColor: deckColor ?? this.deckColor,
      deckColorDark: deckColorDark ?? this.deckColorDark,
      deckValues: deckValues ?? this.deckValues,
    );
  }

  @override
  String toString() {
    return 'Deck(deckName: $deckName, deckImage: $deckImage, deckColor: $deckColor, deckColorDark: $deckColorDark, deckValues: $deckValues)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Deck &&
        o.deckName == deckName &&
        o.deckImage == deckImage &&
        o.deckColor == deckColor &&
        o.deckColorDark == deckColorDark &&
        listEquals(o.deckValues, deckValues);
  }

  @override
  int get hashCode {
    return deckName.hashCode ^ deckImage.hashCode ^ deckColor.hashCode ^ deckColorDark.hashCode ^ deckValues.hashCode;
  }
}
