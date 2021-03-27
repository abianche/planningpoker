import 'package:flutter/material.dart';
import 'package:planningpoker/utils.dart';

class CardBackMini extends StatelessWidget {
  const CardBackMini({
    Key? key,
    required this.card,
  }) : super(key: key);

  final String card;

  @override
  Widget build(BuildContext context) {
    final cardToShow = getTileDataFromName(card);

    if (cardToShow is String) {
      return Center(
        child: Text(
          cardToShow,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textScaleFactor: 5.5,
        ),
      );
    } else if (cardToShow is Color) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              color: cardToShow,
            ),
            width: 80,
            height: 120,
          ),
        ),
      );
    } else if (cardToShow is IconData) {
      return Center(
        child: Icon(cardToShow, size: 64),
      );
    } else if (cardToShow == null) {
      return const Center(
        child: Icon(Icons.lightbulb_outline, size: 64),
      );
    }

    throw ('Unsupported element type for grid.');
  }
}
