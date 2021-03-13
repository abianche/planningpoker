import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/redux/actions/settings.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/utils.dart';
import 'package:redux/redux.dart';

class CustomDeckSetup extends StatefulWidget {
  const CustomDeckSetup({Key key}) : super(key: key);

  @override
  _CustomDeckSetupState createState() => _CustomDeckSetupState();
}

class _CustomDeckSetupState extends State<CustomDeckSetup> {
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading;
  List<String> currentCustomDeck;
  List<String> originalCustomDeck;

  void _toggleCurrentCustomDeckTile(String name) {
    final index = currentCustomDeck.indexOf(name);
    if (index == -1) {
      throw 'Tile with name $name not found.';
    }

    final newList = List<String>.from(currentCustomDeck);
    if (newList.elementAt(index).startsWith('_')) {
      newList[index] = newList[index].substring(1);
    } else {
      newList[index] = '_${newList[index]}';
    }
    setState(() {
      currentCustomDeck = newList;
    });
  }

  @override
  void initState() {
    isLoading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInitialBuild: (vm) {
          setState(() {
            currentCustomDeck = vm.customDeck;
            originalCustomDeck = List.unmodifiable(vm.customDeck);
            isLoading = false;
          });
        },
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).customDeckSetup),
              backgroundColor: Colors.black,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.save),
                  tooltip: AppLocalizations.of(context).customDeckSaveTooltip,
                  onPressed: () {
                    vm.setCustomDeck(currentCustomDeck);

                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    final snackBar = SnackBar(
                      content: Text(
                        AppLocalizations.of(context).customDeckSaveMessage,
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.restore_page),
                  tooltip: AppLocalizations.of(context).customDeckRestoreTooltip,
                  onPressed: () {
                    setState(() {
                      currentCustomDeck = originalCustomDeck;
                    });

                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    final snackBar = SnackBar(
                      content: Text(
                        AppLocalizations.of(context).customDeckRestoreMessage,
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.grey,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ],
            ),
            body: isLoading
                ? const Center(child: CircularProgressIndicator())
                : Scrollbar(
                    child: ReorderableListView(
                      onReorder: _onReorder,
                      children: currentCustomDeck.map(makeTile).toList(),
                    ),
                  ),
          );
        });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }

      setState(() {
        final customDeckEntry = currentCustomDeck.removeAt(oldIndex);
        currentCustomDeck.insert(newIndex, customDeckEntry);
      });
    });
  }

  Widget makeTile(String customDeckEntry) {
    final name = customDeckEntry.startsWith('_') ? customDeckEntry.replaceFirst('_', '') : customDeckEntry;
    final checked = !customDeckEntry.startsWith('_');

    final tile = getTileDataFromName(name);

    if (tile is String) {
      return ListItem(
        key: Key(customDeckEntry),
        title: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
          ),
        ),
        value: customDeckEntry,
        checkState: checked,
        toggleCurrentCustomDeckTile: _toggleCurrentCustomDeckTile,
      );
    }

    if (tile is IconData) {
      return ListItem(
        key: Key(customDeckEntry),
        title: Icon(
          tile,
          size: 36,
        ),
        value: customDeckEntry,
        checkState: checked,
        toggleCurrentCustomDeckTile: _toggleCurrentCustomDeckTile,
      );
    }

    if (tile is Color) {
      return ListItem(
        key: Key(customDeckEntry),
        title: Row(
          children: <Widget>[
            const Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: tile,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 16,
                child: const Text(''),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
        value: customDeckEntry,
        checkState: checked,
        toggleCurrentCustomDeckTile: _toggleCurrentCustomDeckTile,
      );
    }

    throw 'Unsupported type!';
  }
}

class ListItem extends StatefulWidget {
  final Widget title;
  final String value;
  final bool checkState;
  final Function(String) toggleCurrentCustomDeckTile;

  ListItem({
    @required Key key,
    @required this.title,
    @required this.value,
    @required this.checkState,
    @required this.toggleCurrentCustomDeckTile,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _checkState;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: widget.title,
        trailing: Checkbox(
          value: _checkState ?? widget.checkState,
          onChanged: (bool state) {
            setState(() {
              widget.toggleCurrentCustomDeckTile(widget.value);
              _checkState = state;
            });
          },
        ),
      ),
    );
  }
}

class _ViewModel {
  final List<String> customDeck;
  final Function(
    List<String> customDeck,
  ) setCustomDeck;

  _ViewModel({
    @required this.customDeck,
    @required this.setCustomDeck,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      customDeck: settingsSelector(store.state).customDeck,
      setCustomDeck: (
        List<String> newCustomDeck,
      ) {
        store.dispatch(SetSettingsAction(
          settings: settingsSelector(store.state).copyWith(customDeck: newCustomDeck),
        ));
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && listEquals(o.customDeck, customDeck) && o.setCustomDeck == setCustomDeck;
  }

  @override
  int get hashCode => customDeck.hashCode ^ setCustomDeck.hashCode;
}
