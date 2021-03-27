import 'package:planningpoker/models/settings.model.dart';

class SetSettingsAction {
  final Settings settings;

  SetSettingsAction({
    required this.settings,
  });

  @override
  String toString() => 'SetSettingsAction(settings: $settings)';
}

class ClearSettingsAction {}

class LoadSettingsAction {}
