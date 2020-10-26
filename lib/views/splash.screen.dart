import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:planningpoker/redux/actions/settings_actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      onInitialBuild: (vm) => vm.getSettings(),
      ignoreChange: (state) => state.initialized == false,
      onWillChange: (prevVm, newVm) {
        if (newVm.initialized == true) {
          return Navigator.of(context).pushReplacementNamed(Routes.home);
        }
      },
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) => const Scaffold(
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _ViewModel {
  final bool initialized;
  final Function getSettings;

  _ViewModel({
    @required this.initialized,
    @required this.getSettings,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      initialized: initializedSelector(store.state),
      getSettings: () {
        store.dispatch(LoadSettingsAction());
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.initialized == initialized && o.getSettings == getSettings;
  }

  @override
  int get hashCode => initialized.hashCode ^ getSettings.hashCode;
}
