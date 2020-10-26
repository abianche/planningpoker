import 'package:planningpoker/redux/actions/tab.actions.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:redux/redux.dart';

final tabsReducer = combineReducers<AppTab>([
  TypedReducer<AppTab, SetTabAction>(_activeTabReducer),
]);

AppTab _activeTabReducer(AppTab activeTab, SetTabAction action) {
  return action.appTab;
}
