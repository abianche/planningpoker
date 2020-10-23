import 'package:planningpoker/models/settings.model.dart';

enum AppTab { deck, room }

class AppState {
  final AppTab activeTab;
  final Settings settings;

  AppState({
    this.activeTab,
    this.settings,
  });

  AppState.initialState()
      : activeTab = AppTab.deck,
        settings = Settings.initialState();

  AppState copyWith({
    AppTab activeTab,
    Settings settings,
  }) {
    return AppState(
      activeTab: activeTab ?? this.activeTab,
      settings: settings ?? this.settings,
    );
  }

  @override
  String toString() => 'AppState(activeTab: $activeTab, settings: $settings)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppState && o.activeTab == activeTab && o.settings == settings;
  }

  @override
  int get hashCode => activeTab.hashCode ^ settings.hashCode;
}
