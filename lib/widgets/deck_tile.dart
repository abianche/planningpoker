import 'package:flutter/material.dart';
import 'package:planningpoker/models/deck.model.dart';

class DeckTile extends StatefulWidget {
  final Deck deck;
  final dynamic data;
  final String name;

  const DeckTile({
    Key key,
    @required this.deck,
    @required this.data,
    @required this.name,
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
            // await showSelection(vm);
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
            // await showSelection(vm);
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
            // await showSelection(vm);
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

  // void showSelection(_ViewModel vm) async {
  //   final deckProps = deck_types_properties[vm.deck];

  //   vm.setCard(widget.name, false);

  //   await showDialog<bool>(
  //     context: context,
  //     builder: (context) => Dialog(
  //       backgroundColor: Colors.transparent,
  //       child: FractionallySizedBox(
  //         widthFactor: 0.95,
  //         heightFactor: 0.7,
  //         child: FlipCard(
  //           back: vm.tapToReveal
  //               ? CardBack(
  //                   data: widget.data,
  //                   name: widget.name,
  //                   deckProps: deckProps,
  //                   darkTheme: vm.darkTheme,
  //                   goToRoom: vm.goToRoom,
  //                   setCard: vm.setCard,
  //                 )
  //               : null,
  //           front: vm.tapToReveal
  //               ? CardFront(
  //                   deckProps: deckProps,
  //                 )
  //               : CardBack(
  //                   data: widget.data,
  //                   name: widget.name,
  //                   deckProps: deckProps,
  //                   darkTheme: vm.darkTheme,
  //                   goToRoom: vm.goToRoom,
  //                   setCard: vm.setCard,
  //                 ),
  //           direction: FlipDirection.HORIZONTAL,
  //           flipOnTouch: vm.tapToReveal,
  //         ),
  //       ),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(25),
  //       ),
  //     ),
  //   );
  // }
}

// class _ViewModel {
//   final bool tapToReveal;
//   final bool darkTheme;
//   final DeckType deck;
//   void Function(String, bool) setCard;
//   final Function() goToRoom;

//   _ViewModel({
//     @required this.tapToReveal,
//     @required this.darkTheme,
//     @required this.deck,
//     @required this.setCard,
//     @required this.goToRoom,
//   });

//   static _ViewModel fromStore(Store<AppState> store) {
//     return _ViewModel(
//       tapToReveal: settingsSelector(store.state).tapToReveal,
//       darkTheme: settingsSelector(store.state).darkMode,
//       deck: settingsSelector(store.state).deck,
//       // room: roomSelector(store.state),
//       // setCard: (String card, bool revealed) {
//       //   store.dispatch(SetCardAction(card: card, revealed: revealed));
//       // },
//       // goToRoom: () {
//       //   store.dispatch(SetTabAction(AppTab.room));
//       // },
//     );
//   }
// }
