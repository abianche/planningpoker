import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/redux/actions/player.actions.dart';
import 'package:planningpoker/redux/actions/room.actions.dart';
import 'package:planningpoker/redux/actions/settings.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/router.dart';
import 'package:redux/redux.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      onInitialBuild: (vm) => vm.getSettings(),
      ignoreChange: (state) => state.initialized == false,
      onWillChange: (prevVm, newVm) {
        if (newVm.initialized == true) {
          newVm.seenIntro == true
              ? Navigator.of(context).pushReplacementNamed(Routes.home)
              : Navigator.of(context).pushReplacementNamed(Routes.intro);
        }
      },
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
  final bool seenIntro;
  final Function getSettings;

  _ViewModel({
    required this.initialized,
    required this.seenIntro,
    required this.getSettings,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      initialized: initializedSelector(store.state),
      seenIntro: settingsSelector(store.state).seenIntro,
      getSettings: () {
        store.dispatch(LoadSettingsAction());
        store.dispatch(LoadRoomAction());
        store.dispatch(LoadPlayerAction());
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.initialized == initialized && o.seenIntro == seenIntro && o.getSettings == getSettings;
  }

  @override
  int get hashCode => initialized.hashCode ^ seenIntro.hashCode ^ getSettings.hashCode;
}
