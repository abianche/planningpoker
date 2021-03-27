import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/data/decks.dart';
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/actions/tab.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/widgets/card_back_mini.dart';
import 'package:redux/redux.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    Key? key,
    required this.roomId,
    required this.userName,
    required this.player,
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
        var currentDeck = getDeck(vm.settings.selectedDeck);

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
                      message: AppLocalizations.of(context)!.thisIsYou,
                      child: Text(
                        player.username,
                        textScaleFactor: 1.25,
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
              player.isCardConfirmed()
                  ? CardBackMini(card: player.currentCard)
                  : userName != player.username
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(
                                Theme.of(context).brightness == Brightness.dark
                                    ? currentDeck.deckColorDark
                                    : currentDeck.deckColor,
                              ),
                            ),
                          ),
                        )
                      : Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Opacity(opacity: 0.25, child: CardBackMini(card: player.currentCard.substring(1))),
                            if (player.currentCard.isNotEmpty)
                              TextButton(
                                onPressed: () {
                                  vm.setPlayerCard(player.currentCard.substring(1));
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.confirm.toUpperCase(),
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(
                                    Theme.of(context).brightness == Brightness.dark
                                        ? currentDeck.deckColorDark
                                        : currentDeck.deckColor,
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
                                ),
                              )
                            else
                              TextButton(
                                onPressed: () {
                                  vm.setCurrentTab(AppTab.deck);
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.pickACard.toUpperCase(),
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  primary: Color(
                                    Theme.of(context).brightness == Brightness.dark
                                        ? currentDeck.deckColorDark
                                        : currentDeck.deckColor,
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
                                ),
                              )
                          ],
                        ),
              Container(),
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
  final Function(AppTab) setCurrentTab;

  _ViewModel({
    required this.settings,
    required this.room,
    required this.setPlayerCard,
    required this.setCurrentTab,
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
      setCurrentTab: (AppTab currentTab) {
        store.dispatch(SetTabAction(currentTab));
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel &&
        o.settings == settings &&
        o.room == room &&
        o.setPlayerCard == setPlayerCard &&
        o.setCurrentTab == setCurrentTab;
  }

  @override
  int get hashCode => settings.hashCode ^ room.hashCode ^ setPlayerCard.hashCode ^ setCurrentTab.hashCode;
}
