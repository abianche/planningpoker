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
import 'package:planningpoker/services/firestore.service.dart';
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
                      FirestoreService().deleteCurrentPlayer(vm.room.uid);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            StreamBuilder<QuerySnapshot>(
              stream: vm.playersStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final qs = snapshot.data;
                  final playersData = qs.docs;

                  return Expanded(
                    child: GridView.count(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: playersData
                          .map((qds) => PlayerCard(
                              roomId: vm.room.uid,
                              userName: vm.player.username,
                              player: Player.fromJson(
                                (qds.data()),
                              )))
                          .toList(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Ops! An error occurred!'),
                  );
                } else {
                  return const Center(
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
  final Stream<QuerySnapshot> playersStream;

  final Function() logout;

  _ViewModel({
    @required this.player,
    @required this.room,
    @required this.playersStream,
    @required this.logout,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      player: playerSelector(store.state),
      room: roomSelector(store.state),
      playersStream: playersStreamSelector(store.state),
      logout: () {
        store.dispatch(ResetRoomAction());
        store.dispatch(ResetPlayerAction());
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel &&
        o.player == player &&
        o.room == room &&
        o.playersStream == playersStream &&
        o.logout == logout;
  }

  @override
  int get hashCode {
    return player.hashCode ^ room.hashCode ^ playersStream.hashCode ^ logout.hashCode;
  }
}
