import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/data/decks.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/actions/tab.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/router.dart';
import 'package:planningpoker/views/deck.view.dart';
import 'package:planningpoker/views/room.view.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pages = [
    const DeckView(),
    const RoomView(),
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      onWillChange: (previousViewModel, newViewModel) {
        // from room to deck?
        if (previousViewModel.appTab == AppTab.room && newViewModel.appTab == AppTab.deck) {
          newViewModel.resetCard();
        }
      },
      builder: (context, vm) {
        final currentDeck = all_decks[vm.settings.selectedDeck];

        return PlatformScaffold(
          appBar: PlatformAppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context).title),
                Text(
                  AppLocalizations.of(context).deckName(currentDeck.deckName),
                  textScaleFactor: 0.9,
                ),
              ],
            ),
            backgroundColor: Color(currentDeck.deckColor),
            trailingActions: [
              PlatformIconButton(
                icon: Icon(
                  PlatformIcons(context).settings,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pushNamed(Routes.settings),
              ),
            ],
          ),
          body: _pages[vm.appTab.index],
          bottomNavBar: PlatformNavBar(
            material: (_, __) => MaterialNavBarData(
              elevation: 0.0,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
            ),
            backgroundColor:
                Theme.of(context).brightness == Brightness.dark ? Colors.white : Color(currentDeck.deckColor),
            currentIndex: vm.appTab.index,
            itemChanged: (value) => setState(() => vm.setCurrentTab(AppTab.values[value])),
            items: [
              BottomNavigationBarItem(
                label: AppLocalizations.of(context).deck,
                icon: const Icon(Icons.amp_stories),
              ),
              BottomNavigationBarItem(
                label: AppLocalizations.of(context).room,
                icon: Icon(PlatformIcons(context).groupSolid),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final AppTab appTab;
  final Settings settings;

  final Function(AppTab) setCurrentTab;
  final Function() resetCard;

  _ViewModel({
    @required this.appTab,
    @required this.settings,
    @required this.setCurrentTab,
    @required this.resetCard,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      appTab: appTabSelector(store.state),
      settings: settingsSelector(store.state),
      setCurrentTab: (AppTab currentTab) {
        store.dispatch(SetTabAction(currentTab));
      },
      resetCard: () {
        final player = playerSelector(store.state);
        if (player.currentCard != null) {
          String resetCard = player.currentCard;

          if (!player.currentCard.startsWith("_")) {
            resetCard = '_${resetCard}';
          }

          store.dispatch(
            SetPlayerAction(
              player: player.copyWith(currentCard: resetCard),
            ),
          );
        }
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel &&
        o.appTab == appTab &&
        o.settings == settings &&
        o.setCurrentTab == setCurrentTab &&
        o.resetCard == resetCard;
  }

  @override
  int get hashCode => appTab.hashCode ^ settings.hashCode ^ setCurrentTab.hashCode ^ setCurrentTab.hashCode;
}
