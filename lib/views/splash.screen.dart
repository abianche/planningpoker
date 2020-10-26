import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/redux/actions/settings_actions.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/router.dart';
import 'package:redux/redux.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInitialBuild: (vm) => vm.getSettings(),
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) => Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => {Navigator.of(context).pushReplacementNamed(Routes.home)},
            child: Text("go to home"),
          ),
        ),
      ),
    );
  }
}

class _ViewModel {
  final Function getSettings;

  _ViewModel({
    @required this.getSettings,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      getSettings: () {
        store.dispatch(LoadSettingsAction());
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.getSettings == getSettings;
  }

  @override
  int get hashCode => getSettings.hashCode;

  _ViewModel copyWith({
    Function getSettings,
  }) {
    return _ViewModel(
      getSettings: getSettings ?? this.getSettings,
    );
  }
}
