import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info/package_info.dart';
import 'package:planningpoker/constants.dart';
import 'package:planningpoker/data/decks.dart';
import 'package:planningpoker/models/deck.model.dart';
import 'package:planningpoker/models/settings.model.dart';
import 'package:planningpoker/redux/actions/settings.actions.dart';
import 'package:planningpoker/redux/selectors/selectors.dart';
import 'package:planningpoker/redux/states/app_state.dart';
import 'package:planningpoker/router.dart';
import 'package:redux/redux.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.title),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [
            ExpansionTile(
              title: Text(AppLocalizations.of(context)!.selectDeck),
              subtitle: Text(AppLocalizations.of(context)!.selectDeckInfo),
              children: [
                RadioListTile(
                  title: Text(standard_deck.deckName),
                  value: DeckType.standard.index,
                  groupValue: vm.settings.selectedDeck.index,
                  onChanged: (int? newValue) {
                    vm.setSettings(vm.settings.copyWith(selectedDeck: DeckType.standard));
                  },
                ),
                RadioListTile(
                  title: Text(tshirt_deck.deckName),
                  value: DeckType.tshirt.index,
                  groupValue: vm.settings.selectedDeck.index,
                  onChanged: (int? newValue) {
                    vm.setSettings(vm.settings.copyWith(selectedDeck: DeckType.tshirt));
                  },
                ),
                RadioListTile(
                  title: Text(fibonacci_deck.deckName),
                  value: DeckType.fibonacci.index,
                  groupValue: vm.settings.selectedDeck.index,
                  onChanged: (int? newValue) {
                    vm.setSettings(vm.settings.copyWith(selectedDeck: DeckType.fibonacci));
                  },
                ),
                RadioListTile(
                  title: Text(risk_deck.deckName),
                  value: DeckType.risk.index,
                  groupValue: vm.settings.selectedDeck.index,
                  onChanged: (int? newValue) {
                    vm.setSettings(vm.settings.copyWith(selectedDeck: DeckType.risk));
                  },
                ),
                RadioListTile(
                  title: Text(custom_deck.deckName),
                  value: DeckType.custom.index,
                  groupValue: vm.settings.selectedDeck.index,
                  onChanged: (int? newValue) {
                    vm.setSettings(vm.settings.copyWith(selectedDeck: DeckType.custom));
                  },
                  secondary: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.settings_custom_deck);
                    },
                  ),
                ),
              ],
            ),
            const Divider(),
            SwitchListTile(
              title: Text(AppLocalizations.of(context)!.tapToReveal),
              subtitle: Text(AppLocalizations.of(context)!.tapToRevealInfo),
              value: vm.settings.tapToReveal,
              onChanged: (bool value) => vm.setSettings(
                vm.settings.copyWith(tapToReveal: value),
              ),
            ),
            ExpansionTile(
              title: Text(AppLocalizations.of(context)!.themeMode),
              subtitle: Text(AppLocalizations.of(context)!.themeModeInfo),
              children: [
                RadioListTile(
                  title: Text(AppLocalizations.of(context)!.themeModeSystem),
                  value: ThemeMode.system.index,
                  groupValue: vm.settings.themeMode.index,
                  onChanged: (int? newValue) {
                    vm.setSettings(vm.settings.copyWith(themeMode: ThemeMode.system));
                  },
                ),
                RadioListTile(
                  title: Text(AppLocalizations.of(context)!.themeModeLight),
                  value: ThemeMode.light.index,
                  groupValue: vm.settings.themeMode.index,
                  onChanged: (int? newValue) {
                    vm.setSettings(vm.settings.copyWith(themeMode: ThemeMode.light));
                  },
                ),
                RadioListTile(
                  title: Text(AppLocalizations.of(context)!.themeModeDark),
                  value: ThemeMode.dark.index,
                  groupValue: vm.settings.themeMode.index,
                  onChanged: (int? newValue) {
                    vm.setSettings(vm.settings.copyWith(themeMode: ThemeMode.dark));
                  },
                ),
              ],
            ),
            SwitchListTile(
              title: Text(AppLocalizations.of(context)!.vibration),
              subtitle: Text(AppLocalizations.of(context)!.vibrationInfo),
              value: vm.settings.vibration,
              onChanged: (bool value) async {
                vm.setSettings(
                  vm.settings.copyWith(vibration: value),
                );

                final hasVibrator = await Vibration.hasVibrator() ?? false;
                if (value == true && hasVibrator) {
                  Vibration.vibrate();
                }
              },
            ),
            const Divider(),
            ListTile(
              title: Text(AppLocalizations.of(context)!.whatIsPlanningPoker),
              subtitle: Text(AppLocalizations.of(context)!.instructions),
              onTap: () => Navigator.of(context).pushNamed(Routes.settings_info),
            ),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                if (snapshot.hasData) {
                  final packageInfo = snapshot.data!;
                  return AboutListTile(
                    applicationLegalese: '© Alessio Bianchetti',
                    applicationVersion: '${packageInfo.version}-${packageInfo.buildNumber}',
                    applicationIcon: Image.asset(
                      'assets/icon/android_app_logo.png',
                      fit: BoxFit.scaleDown,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return ListTile(
                    title: Text('${AppLocalizations.of(context)!.about} ${AppLocalizations.of(context)!.title}'),
                    subtitle: Text(AppLocalizations.of(context)!.error),
                    enabled: false,
                  );
                } else {
                  return ListTile(
                    title: Text('${AppLocalizations.of(context)!.about} ${AppLocalizations.of(context)!.title}'),
                    subtitle: Text(AppLocalizations.of(context)!.loading),
                    enabled: false,
                  );
                }
              },
            ),
            const Divider(),
            ListTile(
              title: Text(AppLocalizations.of(context)!.showTheIntro),
              subtitle: Text(AppLocalizations.of(context)!.showTheIntroInfo),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.settings_intro);
              },
              trailing: const Icon(Icons.school),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.rateThisApp),
              subtitle: Text(AppLocalizations.of(context)!.rateThisAppInfo),
              onTap: () {
                LaunchReview.launch();
              },
              trailing: const Icon(Icons.thumb_up),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.shareThisApp),
              subtitle: Text(AppLocalizations.of(context)!.shareThisAppInfo),
              onTap: () {
                Share.share(
                  Platform.isIOS ? APP_STORE_URL : PLAY_STORE_URL,
                  subject: AppLocalizations.of(context)!.title,
                );
              },
              trailing: const Icon(Icons.share),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.followMe),
              subtitle: Text(AppLocalizations.of(context)!.followMeInfo),
              onTap: () async {
                if (await canLaunch(PROFILE_URL)) {
                  await launch(PROFILE_URL);
                } else {
                  throw 'Could not launch $PROFILE_URL';
                }
              },
              trailing: const Icon(Icons.sports_bar),
            ),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                if (snapshot.hasData) {
                  final packageInfo = snapshot.data!;
                  final text = StringBuffer()
                    ..write(AppLocalizations.of(context)!.title)
                    ..write(' ')
                    ..write(packageInfo.version)
                    ..write('-')
                    ..write(packageInfo.buildNumber);
                  return ListTile(
                    subtitle: Center(child: Text(text.toString())),
                    enabled: false,
                  );
                } else if (snapshot.hasError) {
                  return ListTile(
                    subtitle: Center(child: Text(AppLocalizations.of(context)!.title)),
                    enabled: false,
                  );
                } else {
                  return ListTile(
                    title: Text(AppLocalizations.of(context)!.title),
                    subtitle: Text(AppLocalizations.of(context)!.loading),
                    enabled: false,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewModel {
  final Settings settings;
  final Function(Settings) setSettings;

  _ViewModel({
    required this.settings,
    required this.setSettings,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      settings: settingsSelector(store.state),
      setSettings: (Settings newSettings) {
        store.dispatch(SetSettingsAction(settings: newSettings));
      },
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is _ViewModel && o.settings == settings && o.setSettings == setSettings;
  }

  @override
  int get hashCode => settings.hashCode ^ setSettings.hashCode;
}
