// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planningpoker/app.dart';
import 'package:planningpoker/redux/middlewares/app.middleware.dart';
import 'package:planningpoker/redux/reducers/app_state.reducer.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/repository.dart';
import 'package:planningpoker/services/firestore.service.dart';
import 'package:redux/redux.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Setup allowed orientation modes
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Initialize Firebase and Firestore
  await Firebase.initializeApp();
  FirestoreService();

  /// Initialize Redux store
  final store = Store<AppState>(
    appReducer,
    distinct: true,
    initialState: AppState.initialState(),
    middleware: createAppMiddleware(Repository()),
  );

  runApp(App(
    store: store,
  ));
}
