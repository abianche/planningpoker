import 'package:cloud_firestore/cloud_firestore.dart' show QuerySnapshot;
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/models/settings.model.dart';

enum AppTab { deck, room }

class AppState {
  final bool initialized;
  final AppTab activeTab;
  final Settings settings;
  final Player player;
  final Room room;
  final Stream<QuerySnapshot> playersStream;

  AppState({
    this.initialized,
    this.activeTab,
    this.settings,
    this.player,
    this.room,
    this.playersStream,
  });

  AppState.initialState()
      : initialized = false,
        activeTab = AppTab.deck,
        settings = Settings.initialState(),
        player = Player.initialState(),
        room = Room.initialState(),
        playersStream = null;

  AppState copyWith({
    bool initialized,
    AppTab activeTab,
    Settings settings,
    Player player,
    Room room,
    Stream<QuerySnapshot> playersStream,
  }) {
    return AppState(
      initialized: initialized ?? this.initialized,
      activeTab: activeTab ?? this.activeTab,
      settings: settings ?? this.settings,
      player: player ?? this.player,
      room: room ?? this.room,
      playersStream: playersStream ?? this.playersStream,
    );
  }

  @override
  String toString() {
    return 'AppState(initialized: $initialized, activeTab: $activeTab, settings: $settings, player: $player, room: $room, playersStream: $playersStream)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppState &&
        o.initialized == initialized &&
        o.activeTab == activeTab &&
        o.settings == settings &&
        o.player == player &&
        o.room == room &&
        o.playersStream == playersStream;
  }

  @override
  int get hashCode {
    return initialized.hashCode ^
        activeTab.hashCode ^
        settings.hashCode ^
        player.hashCode ^
        room.hashCode ^
        playersStream.hashCode;
  }
}
