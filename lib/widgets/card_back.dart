import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/models/deck.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/actions/tab.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/services/firebase.service.dart';
import 'package:planningpoker/widgets/card_content.dart';
import 'package:redux/redux.dart';

class CardBack extends StatelessWidget {
  final dynamic data;
  final Deck deck;
  final String name;

  const CardBack({
    Key? key,
    required this.data,
    required this.deck,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) => Center(
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                Theme.of(context).brightness == Brightness.light
                    ? 'assets/images/deck_front_light.png'
                    : 'assets/images/deck_front_dark.png',
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
              CardContent(data: data),
              if (FirebaseService().auth.currentUser != null && vm.room?.uid != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      vm.setPlayerCard(this.name);

                      vm.setCurrentTab(AppTab.room);
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
                      backgroundColor: Color(
                        Theme.of(context).brightness == Brightness.dark ? deck.deckColorDark : deck.deckColor,
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.confirm.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
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

    return o is _ViewModel && o.settings == settings && o.room == room && o.setCurrentTab == setCurrentTab;
  }

  @override
  int get hashCode => settings.hashCode ^ room.hashCode ^ setCurrentTab.hashCode;
}
