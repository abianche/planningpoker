import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:planningpoker/models/deck.model.dart';
import 'package:planningpoker/widgets/card_back.dart';
import 'package:planningpoker/widgets/card_front.dart';

class DeckTile extends StatefulWidget {
  final Deck deck;
  final dynamic data;
  final String name;
  final bool tapToReveal;

  const DeckTile({
    Key key,
    @required this.deck,
    @required this.data,
    @required this.name,
    @required this.tapToReveal,
  }) : super(key: key);

  @override
  _DeckTileState createState() => _DeckTileState();
}

class _DeckTileState extends State<DeckTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.data is String) {
      return ButtonTheme(
        height: 60.0,
        child: OutlineButton(
          splashColor: Color(widget.deck.deckColor),
          borderSide: BorderSide(color: Color(widget.deck.deckColor), width: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Text(
            widget.data,
            style: const TextStyle(fontSize: 24.0),
          ),
          onPressed: () async {
            await showSelection();
          },
        ),
      );
    }

    if (widget.data is IconData) {
      return ButtonTheme(
        height: 60.0,
        child: OutlineButton(
          splashColor: Color(widget.deck.deckColor),
          borderSide: BorderSide(color: Color(widget.deck.deckColor), width: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Icon(widget.data),
          onPressed: () async {
            await showSelection();
          },
        ),
      );
    }

    if (widget.data is Color) {
      return ButtonTheme(
        height: 60.0,
        child: RaisedButton(
          splashColor: Color(widget.deck.deckColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.all(16.0),
          onPressed: () async {
            await showSelection();
          },
          color: widget.data,
        ),
      );
    }

    return ButtonTheme(
      height: 60.0,
      child: OutlineButton(
        splashColor: Color(widget.deck.deckColor),
        borderSide: BorderSide(color: Color(widget.deck.deckColor), width: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Text(
          '',
          style: const TextStyle(fontSize: 24.0),
        ),
        onPressed: null,
      ),
    );
  }

  void showSelection() async {
    // vm.setCard(widget.name, false);

    await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: FractionallySizedBox(
          widthFactor: 0.95,
          heightFactor: 0.7,
          child: FlipCard(
            back: widget.tapToReveal
                ? CardBack(
                    data: widget.data,
                    name: widget.name,
                    deck: widget.deck,
                    // goToRoom: vm.goToRoom,
                    // setCard: vm.setCard,
                  )
                : null,
            front: widget.tapToReveal
                ? CardFront(
                    deck: widget.deck,
                  )
                : CardBack(
                    data: widget.data,
                    name: widget.name,
                    deck: widget.deck,
                    // goToRoom: vm.goToRoom,
                    // setCard: vm.setCard,
                  ),
            direction: FlipDirection.HORIZONTAL,
            flipOnTouch: widget.tapToReveal,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
