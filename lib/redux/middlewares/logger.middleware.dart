import 'package:planningpoker/logger.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:redux/redux.dart';

final logger = getLogger('Redux');

Middleware<AppState> createLoggerMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    logger.d('${action.runtimeType.toString()} | payload ${action.toString()}');

    next(action);
  };
}
