import 'package:planningpoker/redux/actions/settings_actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/repository.dart';
import 'package:redux/redux.dart';

Middleware<AppState> createSaveSettings(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveSettings(settingsSelector(store.state));
  };
}

Middleware<AppState> createLoadSettings(Repository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadSettings().then((loadedSettings) {
      store.dispatch(SetSettingsAction(settings: loadedSettings));
    });

    next(action);
  };
}
