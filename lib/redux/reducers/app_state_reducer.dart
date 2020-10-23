import 'package:planningpoker/redux/reducers/settings_reducer.dart';
import 'package:planningpoker/redux/reducers/tabs_reducer.dart';
import 'package:planningpoker/redux/states/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    settings: settingsReducer(state.settings, action),
    activeTab: tabsReducer(state.activeTab, action),
  );
}
