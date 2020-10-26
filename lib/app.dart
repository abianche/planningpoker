import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planningpoker/generated/l10n.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/router.dart';
import 'package:planningpoker/views/404.screen.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> store;
  const App({
    Key key,
    @required this.store,
  })  : assert(store != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: this.store,
      child: MaterialApp(
        onGenerateTitle: (context) => L.of(context).title,
        localizationsDelegates: [
          L.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L.delegate.supportedLocales,
        initialRoute: Routes.root,
        routes: getRoutes(),
        onUnknownRoute: (settings) => MaterialPageRoute(
          settings: settings,
          builder: (_) => NotFoundScreen(name: settings.name),
        ),
      ),
    );
  }
}
