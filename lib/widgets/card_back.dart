import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:planningpoker/generated/l10n.dart';
import 'package:planningpoker/models/deck.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/widgets/card_content.dart';

class CardBack extends StatelessWidget {
  final dynamic data;
  final String name;
  final Deck deck;

  const CardBack({
    Key key,
    @required this.data,
    @required this.name,
    @required this.deck,
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
              if (vm.room?.uid != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    onPressed: () async {
                      // final connectivityResult = await (Connectivity().checkConnectivity());
                      // if (connectivityResult == ConnectivityResult.none) {
                      //   await Fluttertoast.cancel();
                      //   await Fluttertoast.showToast(
                      //     msg: 'Cannot open room. No internet connection.',
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.BOTTOM,
                      //     timeInSecForIosWeb: 1,
                      //     backgroundColor: Colors.red,
                      //     textColor: Colors.white,
                      //     fontSize: 14.0,
                      //   );
                      // } else {
                      //   Navigator.of(context).pop();
                      //   setCard(name, true);
                      //   goToRoom();
                      // }
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45.0)),
                    child: Text(
                      L.of(context).openRoom.toUpperCase(),
                      style: TextStyle(
                        color: vm.settings.darkMode ? Colors.black : Colors.white,
                      ),
                    ),
                    color: Color(
                      vm.settings.darkMode ? deck.deckColorDark : deck.deckColor,
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

  _ViewModel({
    @required this.settings,
    @required this.room,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      settings: settingsSelector(store.state),
      room: roomSelector(store.state),
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.settings == settings && o.room == room;
  }

  @override
  int get hashCode => settings.hashCode ^ room.hashCode;
}
