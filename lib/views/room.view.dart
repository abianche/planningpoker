import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/data/decks.dart';
import 'package:planningpoker/logger.dart';
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/actions/recentRoom.action.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/services/firebase.service.dart';
import 'package:planningpoker/services/firestore.service.dart';
import 'package:planningpoker/widgets/players_overview.dart';
import 'package:redux/redux.dart';

final log = getLogger('RoomView');

class RoomView extends StatefulWidget {
  const RoomView({Key? key}) : super(key: key);

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

  Future joinOrCreateRoom(_ViewModel vm, {String? roomName}) async {
    roomController.clear();
    playerController.clear();

    roomController.text = roomName ?? vm.room.name;
    playerController.text = vm.player.username;

    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.joinARoom),
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
                        labelText: AppLocalizations.of(context)!.roomName,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.enterRoomName;
                        }
                        if (value.length > 16) {
                          return AppLocalizations.of(context)!.roomNameIsTooLong;
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      maxLength: 30,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: playerController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.playerName,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.enterPlayerName;
                        }
                        if (value.length > 30) {
                          return AppLocalizations.of(context)!.playerNameIsTooLong;
                        }

                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  if (_keyJoinRoomForm.currentState!.validate()) {
                    final roomName = roomController.text;
                    final playerName = playerController.text;

                    final roomId = await FirestoreService().roomExists(roomName);
                    Room room;
                    final player = Player(
                      username: playerName,
                      currentCard: '_${initial_tile}',
                    );

                    if (roomId.isNotEmpty) {
                      // check if player with the same name exists
                      final playerExists = await FirestoreService().playerExists(roomId, playerName);
                      if (playerExists) {
                        return await showDialog(
                          context: context,
                          barrierColor: Colors.transparent,
                          builder: (context) => AlertDialog(
                            title: Text(AppLocalizations.of(context)!.ops),
                            content:
                                Text(AppLocalizations.of(context)!.playerAlreadyExistsInRoom(playerName, roomName)),
                            actions: [
                              TextButton(
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

                    if (roomId.isNotEmpty) {
                      room = Room.initialState().copyWith(
                        uid: roomId,
                        name: roomName,
                      );
                    } else {
                      room = await FirestoreService().createRoom(roomName, player);
                      await FirestoreService().createPlayer(room.uid, player);
                    }

                    vm.setRoom(room);
                    vm.setPlayer(player);
                    vm.addRecentRoom(room);

                    Navigator.pop(context);
                  }
                },
                child: Text(MaterialLocalizations.of(context).okButtonLabel),
              ),
              TextButton(
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
        var user = FirebaseService().auth.currentUser;
        if (user == null) {
          user = await _signIn();
        }
      },
      builder: (context, vm) => Container(
        child: vm.room.uid.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () => joinOrCreateRoom(vm),
                      icon: const Icon(Icons.group_add),
                      label: Text(AppLocalizations.of(context)!.joinARoom),
                    ),
                    if (vm.recentRooms.isNotEmpty)
                      Column(
                        children: [
                          const SizedBox(height: 30),
                          Text(AppLocalizations.of(context)!.recentRooms),
                          Column(
                            children: vm.recentRooms
                                .map(
                                  (roomName) => TextButton(
                                    child: Text(roomName),
                                    onPressed: () => joinOrCreateRoom(vm, roomName: roomName),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      )
                  ],
                ),
              )
            : PlayersOverview(key: UniqueKey()),
      ),
    );
  }
}

class _ViewModel {
  final Player player;
  final Room room;
  final List<String> recentRooms;

  final Function(Room) setRoom;
  final Function(Player) setPlayer;
  final Function(Room) addRecentRoom;

  _ViewModel({
    required this.player,
    required this.room,
    required this.recentRooms,
    required this.setRoom,
    required this.setPlayer,
    required this.addRecentRoom,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        player: playerSelector(store.state),
        room: roomSelector(store.state),
        recentRooms: recentRoomsSelector(store.state),
        setRoom: (Room room) {
          store.dispatch(SetRoomAction(room: room));
        },
        setPlayer: (Player player) {
          store.dispatch(SetPlayerAction(player: player));
        },
        addRecentRoom: (Room room) {
          store.dispatch(AddRecentRoom(room: room));
        });
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _ViewModel &&
        other.player == player &&
        other.room == room &&
        listEquals(other.recentRooms, recentRooms) &&
        other.setRoom == setRoom &&
        other.setPlayer == setPlayer;
  }

  @override
  int get hashCode {
    return player.hashCode ^ room.hashCode ^ recentRooms.hashCode ^ setRoom.hashCode ^ setPlayer.hashCode;
  }
}
