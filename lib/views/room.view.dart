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
import 'package:redux/redux.dart';

final log = getLogger('RoomView');

class RoomView extends StatefulWidget {
  const RoomView({Key key}) : super(key: key);

  @override
  _RoomViewState createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  final TextEditingController roomController = new TextEditingController();
  final GlobalKey<FormState> _keyJoinRoomForm = new GlobalKey<FormState>();

  Future<User> _signIn() async {
    return await FirebaseService().signInAnonymously();
  }

  Future joinOrCreateRoom(_ViewModel vm) async {
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
                      decoration: const InputDecoration(
                        labelText: 'Room name',
                      ),
                      onSaved: (roomName) async {
                        roomController.text = roomName;
                        final roomId = await FirestoreService().roomExists(roomName);
                        Room room;

                        if (roomId != null) {
                          room = Room.initialState().copyWith(
                            uid: roomId,
                            name: roomName,
                          );
                        } else {
                          room = await FirestoreService().createRoom(roomName);
                        }

                        vm.setRoom(room);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter room name!';
                        }
                        if (value.length > 16) {
                          return 'Room name is too long!';
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
                onPressed: () {
                  if (_keyJoinRoomForm.currentState.validate()) {
                    _keyJoinRoomForm.currentState.save();
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

        store.dispatch(SetPlayerAction(player: playerSelector(store.state).copyWith(uid: user.uid)));
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
            : Center(child: Text(vm.room.toString())),
      ),
    );
  }
}

class _ViewModel {
  final Player player;
  final Room room;

  final Function(Room) setRoom;

  _ViewModel({
    @required this.player,
    @required this.room,
    @required this.setRoom,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      player: playerSelector(store.state),
      room: roomSelector(store.state),
      setRoom: (Room room) {
        store.dispatch(SetRoomAction(room: room));
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.player == player && o.room == room && o.setRoom == setRoom;
  }

  @override
  int get hashCode => player.hashCode ^ room.hashCode ^ setRoom.hashCode;
}
