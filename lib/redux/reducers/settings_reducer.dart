import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/actions/settings_actions.dart';
import 'package:redux/redux.dart';

final settingsReducer = combineReducers<Settings>([
  TypedReducer<Settings, SetSettingsAction>(_setSettings),
  TypedReducer<Settings, ClearSettingsAction>(_clearSettings),
]);

Settings _setSettings(Settings settings, SetSettingsAction action) {
  return settings.copyWith(
    darkTheme: action.darkTheme,
    tapToReveal: action.tapToReveal,
    eggTimer: action.eggTimer,
    vibration: action.vibration,
    selectedDeck: action.deck,
    customDeck: action.customDeck,
    seenIntro: action.seenIntro,
  );
}

Settings _clearSettings(Settings settings, ClearSettingsAction action) {
  return Settings.initialState();
}
