import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/data/decks.dart';
import 'package:planningpoker/generated/l10n.dart';
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/widgets/card_back_mini.dart';
import 'package:redux/redux.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    Key key,
    @required this.roomId,
    @required this.userName,
    @required this.player,
  }) : super(key: key);

  final String roomId;
  final String userName;
  final Player player;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        var currentDeck = all_decks[vm.settings.selectedDeck];

        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              userName != player.username
                  ? Text(
                      player.username,
                      textScaleFactor: 1.25,
                    )
                  : Tooltip(
                      message: "This is you!",
                      child: Text(
                        player.username,
                        textScaleFactor: 1.25,
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
              player.isReady()
                  ? CardBackMini(card: player.currentCard)
                  : Center(
                      child: userName != player.username
                          ? const CircularProgressIndicator()
                          : Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Opacity(opacity: 0.25, child: CardBackMini(card: player.currentCard?.substring(1))),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: FlatButton(
                                    onPressed: () {
                                      vm.setPlayerCard(player.currentCard?.substring(1));
                                    },
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
                                    child: Text(
                                      L.of(context).confirm.toUpperCase(),
                                      style: TextStyle(
                                        color: vm.settings.darkMode ? Colors.black : Colors.white,
                                      ),
                                    ),
                                    color: Color(
                                      vm.settings.darkMode ? currentDeck.deckColorDark : currentDeck.deckColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ),
              Container()
            ],
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final Settings settings;
  final Room room;

  final Function(String) setPlayerCard;

  _ViewModel({
    @required this.settings,
    @required this.room,
    @required this.setPlayerCard,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      settings: settingsSelector(store.state),
      room: roomSelector(store.state),
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

    return o is _ViewModel && o.settings == settings && o.room == room && o.setPlayerCard == setPlayerCard;
  }

  @override
  int get hashCode => settings.hashCode ^ room.hashCode ^ setPlayerCard.hashCode;
}
