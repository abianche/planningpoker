import 'package:planningpoker/models/settings.model.dart';

enum AppTab { deck, room }

class AppState {
  final bool initialized;
  final AppTab activeTab;
  final Settings settings;

  AppState({
    this.initialized,
    this.activeTab,
    this.settings,
  });

  AppState.initialState()
      : initialized = false,
        activeTab = AppTab.deck,
        settings = Settings.initialState();

  AppState copyWith({
    bool initialized,
    AppTab activeTab,
    Settings settings,
  }) {
    return AppState(
      initialized: initialized ?? this.initialized,
      activeTab: activeTab ?? this.activeTab,
      settings: settings ?? this.settings,
    );
  }

  @override
  String toString() => 'AppState(initialized: $initialized, activeTab: $activeTab, settings: $settings)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppState && o.initialized == initialized && o.activeTab == activeTab && o.settings == settings;
  }

  @override
  int get hashCode => initialized.hashCode ^ activeTab.hashCode ^ settings.hashCode;
}
