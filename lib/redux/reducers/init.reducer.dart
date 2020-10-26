import 'package:planningpoker/redux/actions/settings.actions.dart';
import 'package:redux/redux.dart';

final initReducer = combineReducers<bool>([
  TypedReducer<bool, LoadSettingsAction>(_setInitialized),
]);

bool _setInitialized(bool initialized, LoadSettingsAction action) {
  return true;
}
