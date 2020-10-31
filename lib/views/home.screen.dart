import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:planningpoker/data/decks.dart';
import 'package:planningpoker/generated/l10n.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/actions/tab.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/router.dart';
import 'package:planningpoker/views/deck.view.dart';
import 'package:planningpoker/views/room.view.dart';

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
      builder: (context, vm) {
        final currentDeck = all_decks[vm.settings.selectedDeck];

        return Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(L.of(context).title),
                Text(
                  L.of(context).deckName(currentDeck.deckName),
                  textScaleFactor: 0.9,
                ),
              ],
            ),
            centerTitle: false,
            backgroundColor: Color(currentDeck.deckColor),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => Navigator.of(context).pushNamed(Routes.settings),
              ),
            ],
          ),
          body: _pages[vm.appTab.index],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            fixedColor: vm.settings.darkMode ? Colors.white : Color(currentDeck.deckColor),
            currentIndex: vm.appTab.index,
            onTap: (value) => setState(() => vm.setCurrentTab(AppTab.values[value])),
            items: [
              BottomNavigationBarItem(
                label: L.of(context).deck,
                icon: const Icon(Icons.amp_stories),
              ),
              BottomNavigationBarItem(
                label: L.of(context).room,
                icon: const Icon(Icons.people),
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

  _ViewModel({
    @required this.appTab,
    @required this.settings,
    @required this.setCurrentTab,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      appTab: appTabSelector(store.state),
      settings: settingsSelector(store.state),
      setCurrentTab: (AppTab currentTab) {
        store.dispatch(SetTabAction(currentTab));
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.appTab == appTab && o.settings == settings && o.setCurrentTab == setCurrentTab;
  }

  @override
  int get hashCode => appTab.hashCode ^ settings.hashCode ^ setCurrentTab.hashCode;
}
