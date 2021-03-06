import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/actions/settings.actions.dart';
import 'package:redux/redux.dart';

final settingsReducer = combineReducers<Settings>([
  TypedReducer<Settings, SetSettingsAction>(_setSettings),
  TypedReducer<Settings, ClearSettingsAction>(_clearSettings),
]);

Settings _setSettings(Settings settings, SetSettingsAction action) {
  return settings.copyWith(
    themeMode: action.settings.themeMode,
    tapToReveal: action.settings.tapToReveal,
    vibration: action.settings.vibration,
    selectedDeck: action.settings.selectedDeck,
    customDeck: action.settings.customDeck,
    seenIntro: action.settings.seenIntro,
  );
}

Settings _clearSettings(Settings settings, ClearSettingsAction action) {
  return Settings.initialState();
}
