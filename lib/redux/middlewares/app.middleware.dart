import 'package:planningpoker/redux/actions/settings.actions.dart';
import 'package:planningpoker/redux/middlewares/settings.middleware.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/repository.dart';
import 'package:redux/redux.dart';

/// Returns all the app middlewares to be used in the [Store] declaration.
List<Middleware<AppState>> createAppMiddleware(
  Repository repository,
) {
  final saveSettings = createSaveSettings(repository);
  final loadSettings = createLoadSettings(repository);

  return [
    TypedMiddleware<AppState, SetSettingsAction>(saveSettings),
    TypedMiddleware<AppState, ClearSettingsAction>(saveSettings),
    TypedMiddleware<AppState, LoadSettingsAction>(loadSettings),
  ];
}
