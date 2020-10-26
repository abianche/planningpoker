import 'package:planningpoker/redux/reducers/init.reducer.dart';
import 'package:planningpoker/redux/reducers/settings.reducer.dart';
import 'package:planningpoker/redux/reducers/tabs.reducer.dart';
import 'package:planningpoker/redux/states/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    initialized: initReducer(state.initialized, action),
    settings: settingsReducer(state.settings, action),
    activeTab: tabsReducer(state.activeTab, action),
  );
}
