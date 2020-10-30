// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:planningpoker/app.dart';
import 'package:planningpoker/redux/reducers/app_state.reducer.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final store = Store<AppState>(
      appReducer,
      distinct: true,
      initialState: AppState.initialState(),
    );

    // ignore: prefer_const_constructors
    await tester.pumpWidget(App(
      store: store,
    ));
  });
}
