import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/states/app_state.dart';

Settings settingsSelector(AppState state) => state.settings;
AppTab activeTabSelector(AppState state) => state.activeTab;
