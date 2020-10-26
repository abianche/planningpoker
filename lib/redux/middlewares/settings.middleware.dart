import 'package:planningpoker/redux/actions/settings_actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/repository.dart';
import 'package:redux/redux.dart';

/// Save settings middleware which perists the settings to the [Repository].
Middleware<AppState> createSaveSettings(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveSettings(settingsSelector(store.state));
  };
}

/// Load settings middleware which restores the settings from the [Repository].
Middleware<AppState> createLoadSettings(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadSettings().then((loadedSettings) {
      store.dispatch(SetSettingsAction(settings: loadedSettings));
    });

    next(action);
  };
}
