import 'package:planningpoker/redux/states/app_state.dart';

class SetTabAction {
  final AppTab appTab;

  SetTabAction(
    this.appTab,
  );

  @override
  String toString() => 'SetTabAction(appTab: $appTab)';
}
