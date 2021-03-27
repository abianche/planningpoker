import 'package:planningpoker/models/deck.model.dart';

const String initial_tile = "local_cafe";

/// Standard deck.
const standard_deck = Deck(
  deckName: 'Standard',
  deckImage: 'deck_back_blue.png',
  deckColor: 0xFF1F6098,
  deckColorDark: 0xFF6CADE5,
  deckValues: [
    '0',
    '½',
    '1',
    '2',
    '3',
    '5',
    '8',
    '13',
    '20',
    '40',
    '100',
    '∞',
    '?',
    'local_cafe',
  ],
);

/// T-Shirt deck.
const tshirt_deck = Deck(
  deckName: 'T-Shirt',
  deckImage: 'deck_back_red.png',
  deckColor: 0xFF981F28,
  deckColorDark: 0xFFE56C75,
  deckValues: [
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    '∞',
    '?',
    'local_cafe',
  ],
);

/// Fibonacci deck.
const fibonacci_deck = Deck(
  deckName: 'Fibonacci',
  deckImage: 'deck_back_green.png',
  deckColor: 0xFF6C9A40,
  deckColorDark: 0xFFB9E78D,
  deckValues: [
    '0',
    '1',
    '2',
    '3',
    '5',
    '8',
    '13',
    '21',
    '34',
    '55',
    '89',
    '144',
    '∞',
    '?',
    'local_cafe',
  ],
);

/// Risk deck.
const risk_deck = Deck(
  deckName: 'Risk planning',
  deckImage: 'deck_back_orange.png',
  deckColor: 0xFFB05E24,
  deckColorDark: 0xFFFDAB71,
  deckValues: [
    'green',
    'yellow',
    'orange',
    'purple',
    'red',
    '?',
    'local_cafe',
  ],
);

/// Custom deck.
const custom_deck = Deck(
  deckName: 'Custom',
  deckImage: 'deck_back_black.png',
  deckColor: 0xFF000000,
  deckColorDark: 0xFFFFFFFF,

  /// if the [Settings] contains a custom deck definition, that will be used instead.
  deckValues: [
    '0',
    '_½',
    '1',
    '2',
    '_3',
    '5',
    '8',
    '13',
    '_20',
    '_21',
    '_34',
    '_40',
    '_55',
    '_89',
    '_100',
    '_144',
    '_∞',
    '_?',
    'local_cafe',
    '_XS',
    '_S',
    '_M',
    '_L',
    '_XL',
    '_XXL',
    'green',
    '_yellow',
    '_orange',
    '_purple',
    'red',
  ],
);

getDeck(DeckType deckType) {
  switch (deckType) {
    case DeckType.standard:
      return standard_deck;
    case DeckType.tshirt:
      return tshirt_deck;
    case DeckType.fibonacci:
      return fibonacci_deck;
    case DeckType.risk:
      return risk_deck;
    case DeckType.custom:
      return custom_deck;
    default:
      return standard_deck;
  }
}
