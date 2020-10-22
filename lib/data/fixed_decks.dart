import 'package:planningpoker/models/deck.model.dart';

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

const custom_deck = Deck(
  deckName: 'Custom deck',
  deckImage: 'deck_back_black.png',
  deckColor: 0xFF000000,
  deckColorDark: 0xFFFFFFFF,
);

const Map<DeckType, Deck> fixed_decks = {
  DeckType.standard: standard_deck,
  DeckType.tshirt: tshirt_deck,
  DeckType.fibonacci: fibonacci_deck,
  DeckType.risk: risk_deck,
  DeckType.custom: custom_deck,
};
