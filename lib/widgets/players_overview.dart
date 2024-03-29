import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/services/firestore.service.dart';
import 'package:planningpoker/utils.dart';
import 'package:planningpoker/widgets/player_card.dart';
import 'package:redux/redux.dart';

class PlayersOverview extends StatelessWidget {
  const PlayersOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) => Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${AppLocalizations.of(context)!.room}: ${vm.room.name} | ${AppLocalizations.of(context)!.owner}: ${vm.room.owner}'),
                      const SizedBox(height: 5),
                      Text('${AppLocalizations.of(context)!.username}: ${vm.player.username}'),
                    ],
                  ),
                  IconButton(
                    tooltip: AppLocalizations.of(context)!.logout,
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
                List<QueryDocumentSnapshot> playersData = [];

                try {
                  playersData = snapshot.requireData.docs;
                } catch (e) {}

                if (snapshot.hasData) {
                  final qs = snapshot.data!;
                  playersData = qs.docs;
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Ops! An error occurred!'),
                  );
                } else if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData && kIsWeb == true) {
                  vm.forceResetRoom();
                }

                // sort current player first
                if (playersData.isNotEmpty) {
                  final currentPlayerPos = playersData.indexWhere(
                      (qds) => Player.fromJson(qds.data() as Map<String, dynamic>).username == vm.player.username);
                  final currentPlayer = playersData.removeAt(currentPlayerPos);
                  playersData.insert(0, currentPlayer);
                }

                return Expanded(
                  child: Column(
                    children: [
                      PlayerOverviewAvg(playersData: playersData),
                      Expanded(
                        child: GridView.count(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: playersData.length >= 6 ? 3 : 2,
                          children: playersData
                              .map((qds) => PlayerCard(
                                  roomId: vm.room.uid,
                                  userName: vm.player.username,
                                  player: Player.fromJson(qds.data() as Map<String, dynamic>)))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            if (vm.room.owner == vm.player.username)
              TextButton(
                onPressed: () {
                  vm.clearAllPlayerCards();
                },
                child: Text(AppLocalizations.of(context)!.clearAll),
              ),
          ],
        ),
      ),
    );
  }
}

class PlayerOverviewAvg extends StatelessWidget {
  final List<QueryDocumentSnapshot> playersData;

  const PlayerOverviewAvg({
    Key? key,
    required this.playersData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalNumber = 0.0;
    int totalNumberCount = 0;
    List<String> symbols = [];

    playersData.forEach((qds) {
      final player = Player.fromJson(qds.data() as Map<String, dynamic>);
      if (!player.isCardConfirmed()) {
        return;
      }

      final data = getTileDataFromName(player.currentCard);
      if (data is String) {
        final number = int.tryParse(data);

        if (number != null) {
          totalNumber += number;
          totalNumberCount++;
          return;
        }

        if (data == "½") {
          totalNumber += 0.5;
          totalNumberCount++;
          return;
        }

        symbols.add(data);
        return;
      }

      symbols.add(player.currentCard[0].toUpperCase());
    });

    double average = totalNumber / totalNumberCount;
    return Container(
      child: Text(
        average.isNaN ? '' : '${average.toStringAsFixed(1)} ${symbols.join(" ")}',
        style: const TextStyle(
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class _ViewModel {
  final Player player;
  final Room room;
  final Stream<QuerySnapshot> playersStream;
  final Function forceResetRoom;
  final Function clearAllPlayerCards;

  final Function() logout;

  _ViewModel({
    required this.player,
    required this.room,
    required this.forceResetRoom,
    required this.clearAllPlayerCards,
    required this.playersStream,
    required this.logout,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      player: playerSelector(store.state),
      room: roomSelector(store.state),
      playersStream: FirestoreService().getPlayersStream(store.state.room.uid),
      logout: () {
        store.dispatch(ResetRoomAction());
        store.dispatch(ResetPlayerAction());
      },
      forceResetRoom: () {
        store.dispatch(SetRoomAction(room: roomSelector(store.state)));
      },
      clearAllPlayerCards: () {
        store.dispatch(ClearAllPlayerCardsAction());
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
