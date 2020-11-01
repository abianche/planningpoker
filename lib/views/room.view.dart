import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/generated/l10n.dart';
import 'package:planningpoker/logger.dart';
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/services/firebase.service.dart';
import 'package:planningpoker/services/firestore.service.dart';
import 'package:planningpoker/widgets/players_overview.dart';
import 'package:redux/redux.dart';

final log = getLogger('RoomView');

class RoomView extends StatefulWidget {
  const RoomView({Key key}) : super(key: key);

  @override
  _RoomViewState createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  final TextEditingController roomController = new TextEditingController();
  final TextEditingController playerController = new TextEditingController();
  final GlobalKey<FormState> _keyJoinRoomForm = new GlobalKey<FormState>();

  Future<User> _signIn() async {
    return await FirebaseService().signInAnonymously();
  }

  Future joinOrCreateRoom(_ViewModel vm) async {
    roomController.clear();
    playerController.clear();

    roomController.text = "test";
    playerController.text = "playerone";

    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(L.of(context).joinARoom),
            content: SingleChildScrollView(
              child: Form(
                key: _keyJoinRoomForm,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      maxLength: 16,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: roomController,
                      decoration: InputDecoration(
                        labelText: L.of(context).roomName,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return L.of(context).enterRoomName;
                        }
                        if (value.length > 16) {
                          return L.of(context).roomNameIsTooLong;
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      maxLength: 30,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: playerController,
                      decoration: InputDecoration(
                        labelText: L.of(context).playerName,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return L.of(context).enterPlayerName;
                        }
                        if (value.length > 30) {
                          return L.of(context).playerNameIsTooLong;
                        }

                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  if (_keyJoinRoomForm.currentState.validate()) {
                    final roomName = roomController.text;
                    final playerName = playerController.text;

                    final roomId = await FirestoreService().roomExists(roomName);
                    Room room;
                    final player = Player(
                      username: playerName,
                    );

                    if (roomId != null) {
                      // check if player with the same name exists
                      final playerExists = await FirestoreService().playerExists(roomId, playerName);
                      if (playerExists) {
                        return await showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (context) => AlertDialog(
                            title: Text(L.of(context).ops),
                            content: Text(L.of(context).playerAlreadyExistsInRoom(playerName, roomName)),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(MaterialLocalizations.of(context).okButtonLabel),
                              ),
                            ],
                          ),
                        );
                      } else {
                        await FirestoreService().createPlayer(roomId, player);
                      }
                    }

                    if (roomId != null) {
                      room = Room.initialState().copyWith(
                        uid: roomId,
                        name: roomName,
                      );
                    } else {
                      room = await FirestoreService().createRoom(roomName);
                      await FirestoreService().createPlayer(room.uid, player);
                    }

                    vm.setRoom(room);
                    vm.setPlayer(player);

                    Navigator.pop(context);
                  }
                },
                child: Text(MaterialLocalizations.of(context).okButtonLabel),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      onInit: (store) async {
        var user = FirebaseService().auth?.currentUser;
        if (user == null) {
          user = await _signIn();
        }
      },
      builder: (context, vm) => Container(
        child: vm.room.uid == null
            ? Center(
                child: FlatButton.icon(
                  onPressed: () => joinOrCreateRoom(vm),
                  icon: const Icon(Icons.group_add),
                  label: Text(L.of(context).joinARoom),
                ),
              )
            : const PlayersOverview(),
      ),
    );
  }
}

class _ViewModel {
  final Player player;
  final Room room;

  final Function(Room) setRoom;
  final Function(Player) setPlayer;

  _ViewModel({
    @required this.player,
    @required this.room,
    @required this.setRoom,
    @required this.setPlayer,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      player: playerSelector(store.state),
      room: roomSelector(store.state),
      setRoom: (Room room) {
        store.dispatch(SetRoomAction(room: room));
      },
      setPlayer: (Player player) {
        store.dispatch(SetPlayerAction(player: player));
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.player == player && o.room == room && o.setRoom == setRoom && o.setPlayer == setPlayer;
  }

  @override
  int get hashCode {
    return player.hashCode ^ room.hashCode ^ setRoom.hashCode ^ setPlayer.hashCode;
  }
}
