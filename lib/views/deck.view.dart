import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/data/decks.dart';
import 'package:planningpoker/models/deck.model.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/utils.dart';
import 'package:redux/redux.dart';

class DeckView extends StatelessWidget {
  const DeckView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        var currentDeck = all_decks[vm.settings.selectedDeck]!;
        if (vm.settings.selectedDeck == DeckType.custom && vm.settings.customDeck != null) {
          // make sure we use the saved configuration for custom deck
          currentDeck = custom_deck.copyWith(deckValues: vm.settings.customDeck);
        }

        return Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: getDeckTiles(currentDeck, vm.settings.tapToReveal),
            ),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final Settings settings;

  _ViewModel({
    required this.settings,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      settings: settingsSelector(store.state),
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.settings == settings;
  }

  @override
  int get hashCode => settings.hashCode;
}
