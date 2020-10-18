import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck.freezed.dart';
part 'deck.g.dart';

enum DeckType { standard, tshirt, fibonacci, risk, custom }

@freezed
abstract class Deck with _$Deck {
  const factory Deck({
    final String name,
    final String image,
    final String color,
    final String colorDark,
    final List<String> values,
  }) = _Deck;

  factory Deck.fromJson(Map<String, dynamic> json) => _$DeckFromJson(json);
}
