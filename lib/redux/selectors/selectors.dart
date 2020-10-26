import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/states/app_state.dart';

/// Selects the [Settings] portion of the state.
Settings settingsSelector(AppState state) => state.settings;

/// Selects the [AppTab] portion of the state.
AppTab activeTabSelector(AppState state) => state.activeTab;
