import 'package:flutter/material.dart';
import 'package:planningpoker/models/deck.model.dart';
import 'package:planningpoker/widgets/deck_tile.dart';

const row_length = 3;

/// Returns the a list of [DeckTile]s from the current deck. Disabled tiles are not returned.
List<Widget> getDeckTiles(
  Deck deck,
  bool tapToReveal,
) {
  final items = <Widget>[];
  final tileNames = deck.deckValues.toList();
  tileNames.removeWhere((value) => value.startsWith('_'));

  var taken = 0;

  while (taken < tileNames.length) {
    final List<Widget> tiles = tileNames
        .skip(taken)
        .take(row_length)
        .map(
          (name) => DeckTile(
            deck: deck,
            data: getTileDataFromName(name),
            name: name,
            tapToReveal: tapToReveal,
          ),
        )
        .toList();

    items.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tiles,
      ),
    );

    taken += row_length;
  }

  return items;
}

/// Returns the data for a [DeckTile] based on the name.
dynamic getTileDataFromName(String name) {
  switch (name) {
    case 'green':
      return Colors.green;
    case 'yellow':
      return Colors.yellow;
    case 'orange':
      return Colors.orange;
    case 'purple':
      return Colors.purple;
    case 'red':
      return Colors.red;
    case 'local_cafe':
      return Icons.local_cafe;
    default:
      return name;
  }
}
