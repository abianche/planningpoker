import 'package:planningpoker/redux/reducers/init.reducer.dart';
import 'package:planningpoker/redux/reducers/player.reducer.dart';
import 'package:planningpoker/redux/reducers/playersStream.reducer.dart';
import 'package:planningpoker/redux/reducers/recentRoom.reducer.dart';
import 'package:planningpoker/redux/reducers/room.reducer.dart';
import 'package:planningpoker/redux/reducers/settings.reducer.dart';
import 'package:planningpoker/redux/reducers/tabs.reducer.dart';
import 'package:planningpoker/redux/states/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    initialized: initReducer(state.initialized, action),
    settings: settingsReducer(state.settings, action),
    activeTab: tabsReducer(state.activeTab, action),
    player: playerReducer(state.player, action),
    room: roomReducer(state.room, action),
    playersStream: playersStreamReducer(state.playersStream, action),
    recentRooms: recentRoomsReducer(state.recentRooms, action),
  );
}
