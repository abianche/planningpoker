import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/generated/l10n.dart';
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/widgets/player_card.dart';
import 'package:redux/redux.dart';

class PlayersOverview extends StatelessWidget {
  const PlayersOverview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) => Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${L.of(context).room}: ${vm.room.name}'),
                      const SizedBox(height: 5),
                      Text('${L.of(context).username}: ${vm.player.username}'),
                    ],
                  ),
                  IconButton(
                    tooltip: L.of(context).logout,
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      vm.logout();
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection('rooms').doc(vm.room.uid).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final ds = snapshot.data;
                  final room = Room.fromJson(ds.data());

                  return Expanded(
                    child: GridView.count(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: room.players
                          .map((player) => PlayerCard(
                                roomId: room.uid,
                                userName: vm.player.username,
                                player: player,
                              ))
                          .toList(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Ops! An error occurred!'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewModel {
  final Player player;
  final Room room;

  final Function() logout;

  _ViewModel({
    @required this.player,
    @required this.room,
    @required this.logout,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      player: playerSelector(store.state),
      room: roomSelector(store.state),
      logout: () {
        store.dispatch(ResetRoomAction());
        store.dispatch(ResetPlayerAction());
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.player == player && o.room == room && o.logout == logout;
  }

  @override
  int get hashCode => player.hashCode ^ room.hashCode ^ logout.hashCode;
}
