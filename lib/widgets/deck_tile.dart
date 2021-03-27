import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/models/deck.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/widgets/card_back.dart';
import 'package:planningpoker/widgets/card_front.dart';
import 'package:redux/redux.dart';

class DeckTile extends StatefulWidget {
  final Deck deck;
  final dynamic data;
  final String name;
  final bool tapToReveal;

  const DeckTile({
    Key? key,
    required this.deck,
    required this.data,
    required this.name,
    required this.tapToReveal,
  }) : super(key: key);

  @override
  _DeckTileState createState() => _DeckTileState();
}

class _DeckTileState extends State<DeckTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.data is String) {
      return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) => OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(85.0, 50.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: Color(
                Theme.of(context).brightness == Brightness.dark ? widget.deck.deckColorDark : widget.deck.deckColor),
          ),
          child: Text(
            widget.data,
            style: const TextStyle(fontSize: 24.0),
          ),
          onPressed: () async {
            vm.setPlayerCard((widget.tapToReveal ? '_${widget.name}' : widget.name));
            await showSelection();
          },
        ),
      );
    }

    if (widget.data is IconData) {
      return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) => OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(85.0, 50.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: Color(
                Theme.of(context).brightness == Brightness.dark ? widget.deck.deckColorDark : widget.deck.deckColor),
          ),
          child: Icon(widget.data),
          onPressed: () async {
            vm.setPlayerCard((widget.tapToReveal ? '_${widget.name}' : widget.name));
            await showSelection();
          },
        ),
      );
    }

    if (widget.data is Color) {
      return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) => ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(85.0, 50.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: widget.data,
          ),
          onPressed: () async {
            vm.setPlayerCard((widget.tapToReveal ? '_${widget.name}' : widget.name));
            await showSelection();
          },
          child: const Text(
            ' ',
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
      );
    }

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: const Text(
        '',
        style: const TextStyle(fontSize: 24.0),
      ),
      onPressed: null,
    );
  }

  Future showSelection() async {
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
                    deck: widget.deck,
                    name: widget.name,
                  )
                : null,
            front: widget.tapToReveal
                ? CardFront(
                    deck: widget.deck,
                  )
                : CardBack(
                    data: widget.data,
                    deck: widget.deck,
                    name: widget.name,
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

class _ViewModel {
  final Function(String) setPlayerCard;

  _ViewModel({
    required this.setPlayerCard,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      setPlayerCard: (String playerCard) {
        store.dispatch(
          SetPlayerAction(
            player: playerSelector(store.state).copyWith(currentCard: playerCard),
          ),
        );
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.setPlayerCard == setPlayerCard;
  }

  @override
  int get hashCode => setPlayerCard.hashCode;
}
