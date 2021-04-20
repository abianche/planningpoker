import 'package:cloud_firestore/cloud_firestore.dart' show QuerySnapshot;
import 'package:flutter/foundation.dart';
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
  final List<String> recentRooms;

  AppState({
    required this.initialized,
    required this.activeTab,
    required this.settings,
    required this.player,
    required this.room,
    required this.playersStream,
    required this.recentRooms,
  });

  AppState.initialState()
      : initialized = false,
        activeTab = AppTab.deck,
        settings = Settings.initialState(),
        player = Player.initialState(),
        room = Room.initialState(),
        playersStream = const Stream<QuerySnapshot>.empty(),
        recentRooms = [];

  AppState copyWith({
    bool? initialized,
    AppTab? activeTab,
    Settings? settings,
    Player? player,
    Room? room,
    Stream<QuerySnapshot>? playersStream,
    List<String>? recentRooms,
  }) {
    return AppState(
      initialized: initialized ?? this.initialized,
      activeTab: activeTab ?? this.activeTab,
      settings: settings ?? this.settings,
      player: player ?? this.player,
      room: room ?? this.room,
      playersStream: playersStream ?? this.playersStream,
      recentRooms: recentRooms ?? this.recentRooms,
    );
  }

  @override
  String toString() {
    return 'AppState(initialized: $initialized, activeTab: $activeTab, settings: $settings, player: $player, room: $room, playersStream: $playersStream, recentRooms: $recentRooms)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppState &&
        other.initialized == initialized &&
        other.activeTab == activeTab &&
        other.settings == settings &&
        other.player == player &&
        other.room == room &&
        other.playersStream == playersStream &&
        listEquals(other.recentRooms, recentRooms);
  }

  @override
  int get hashCode {
    return initialized.hashCode ^
        activeTab.hashCode ^
        settings.hashCode ^
        player.hashCode ^
        room.hashCode ^
        playersStream.hashCode ^
        recentRooms.hashCode;
  }
}
