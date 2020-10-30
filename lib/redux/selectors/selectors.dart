import 'package:cloud_firestore/cloud_firestore.dart' show DocumentSnapshot;
import 'package:planningpoker/models/player.model.dart';
import 'package:planningpoker/models/room.model.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/states/app_state.dart';

/// Selects the [Settings] portion of the state.
Settings settingsSelector(AppState state) => state.settings;

/// Selects the [AppTab] portion of the state.
AppTab activeTabSelector(AppState state) => state.activeTab;

/// Selects the initialized of the state.
bool initializedSelector(AppState state) => state.initialized;

/// Selectes the [Player] portion of the state.
Player playerSelector(AppState state) => state.player;

/// Selectes the [Room] portion of the state.
Room roomSelector(AppState state) => state.room;

/// Selectes the [Stream<DocumentSnapshot>] portion of the state.
Stream<DocumentSnapshot> roomStreamSelector(AppState state) => state.roomStream;
