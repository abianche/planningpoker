import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/router.dart';
import 'package:planningpoker/theme.dart';
import 'package:planningpoker/views/404.screen.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> store;
  const App({
    Key? key,
    required this.store,
  })   : assert(store != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: this.store,
      child: StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) => MaterialApp(
          onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          themeMode: vm.themeMode,
          initialRoute: Routes.root,
          routes: getRoutes(),
          onUnknownRoute: (settings) => MaterialPageRoute(
            settings: settings,
            builder: (_) => NotFoundScreen(name: settings.name),
          ),
        ),
      ),
    );
  }
}

class _ViewModel {
  final ThemeMode themeMode;

  _ViewModel({
    required this.themeMode,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      themeMode: settingsSelector(store.state).themeMode,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
}
