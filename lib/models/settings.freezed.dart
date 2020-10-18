// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
class _$SettingsTearOff {
  const _$SettingsTearOff();

// ignore: unused_element
  _Settings call(
      {bool darkTheme,
      bool tapToReveal,
      double eggTimer,
      bool vibration,
      DeckType selectedDeck,
      List<String> customDeck,
      bool seenIntro}) {
    return _Settings(
      darkTheme: darkTheme,
      tapToReveal: tapToReveal,
      eggTimer: eggTimer,
      vibration: vibration,
      selectedDeck: selectedDeck,
      customDeck: customDeck,
      seenIntro: seenIntro,
    );
  }

// ignore: unused_element
  Settings fromJson(Map<String, Object> json) {
    return Settings.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Settings = _$SettingsTearOff();

/// @nodoc
mixin _$Settings {
  bool get darkTheme;
  bool get tapToReveal;
  double get eggTimer;
  bool get vibration;
  DeckType get selectedDeck;
  List<String> get customDeck;
  bool get seenIntro;

  Map<String, dynamic> toJson();
  $SettingsCopyWith<Settings> get copyWith;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {bool darkTheme,
      bool tapToReveal,
      double eggTimer,
      bool vibration,
      DeckType selectedDeck,
      List<String> customDeck,
      bool seenIntro});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object darkTheme = freezed,
    Object tapToReveal = freezed,
    Object eggTimer = freezed,
    Object vibration = freezed,
    Object selectedDeck = freezed,
    Object customDeck = freezed,
    Object seenIntro = freezed,
  }) {
    return _then(_value.copyWith(
      darkTheme: darkTheme == freezed ? _value.darkTheme : darkTheme as bool,
      tapToReveal:
          tapToReveal == freezed ? _value.tapToReveal : tapToReveal as bool,
      eggTimer: eggTimer == freezed ? _value.eggTimer : eggTimer as double,
      vibration: vibration == freezed ? _value.vibration : vibration as bool,
      selectedDeck: selectedDeck == freezed
          ? _value.selectedDeck
          : selectedDeck as DeckType,
      customDeck: customDeck == freezed
          ? _value.customDeck
          : customDeck as List<String>,
      seenIntro: seenIntro == freezed ? _value.seenIntro : seenIntro as bool,
    ));
  }
}

/// @nodoc
abstract class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) then) =
      __$SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool darkTheme,
      bool tapToReveal,
      double eggTimer,
      bool vibration,
      DeckType selectedDeck,
      List<String> customDeck,
      bool seenIntro});
}

/// @nodoc
class __$SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(_Settings _value, $Res Function(_Settings) _then)
      : super(_value, (v) => _then(v as _Settings));

  @override
  _Settings get _value => super._value as _Settings;

  @override
  $Res call({
    Object darkTheme = freezed,
    Object tapToReveal = freezed,
    Object eggTimer = freezed,
    Object vibration = freezed,
    Object selectedDeck = freezed,
    Object customDeck = freezed,
    Object seenIntro = freezed,
  }) {
    return _then(_Settings(
      darkTheme: darkTheme == freezed ? _value.darkTheme : darkTheme as bool,
      tapToReveal:
          tapToReveal == freezed ? _value.tapToReveal : tapToReveal as bool,
      eggTimer: eggTimer == freezed ? _value.eggTimer : eggTimer as double,
      vibration: vibration == freezed ? _value.vibration : vibration as bool,
      selectedDeck: selectedDeck == freezed
          ? _value.selectedDeck
          : selectedDeck as DeckType,
      customDeck: customDeck == freezed
          ? _value.customDeck
          : customDeck as List<String>,
      seenIntro: seenIntro == freezed ? _value.seenIntro : seenIntro as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Settings implements _Settings {
  _$_Settings(
      {this.darkTheme,
      this.tapToReveal,
      this.eggTimer,
      this.vibration,
      this.selectedDeck,
      this.customDeck,
      this.seenIntro});

  factory _$_Settings.fromJson(Map<String, dynamic> json) =>
      _$_$_SettingsFromJson(json);

  @override
  final bool darkTheme;
  @override
  final bool tapToReveal;
  @override
  final double eggTimer;
  @override
  final bool vibration;
  @override
  final DeckType selectedDeck;
  @override
  final List<String> customDeck;
  @override
  final bool seenIntro;

  @override
  String toString() {
    return 'Settings(darkTheme: $darkTheme, tapToReveal: $tapToReveal, eggTimer: $eggTimer, vibration: $vibration, selectedDeck: $selectedDeck, customDeck: $customDeck, seenIntro: $seenIntro)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Settings &&
            (identical(other.darkTheme, darkTheme) ||
                const DeepCollectionEquality()
                    .equals(other.darkTheme, darkTheme)) &&
            (identical(other.tapToReveal, tapToReveal) ||
                const DeepCollectionEquality()
                    .equals(other.tapToReveal, tapToReveal)) &&
            (identical(other.eggTimer, eggTimer) ||
                const DeepCollectionEquality()
                    .equals(other.eggTimer, eggTimer)) &&
            (identical(other.vibration, vibration) ||
                const DeepCollectionEquality()
                    .equals(other.vibration, vibration)) &&
            (identical(other.selectedDeck, selectedDeck) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDeck, selectedDeck)) &&
            (identical(other.customDeck, customDeck) ||
                const DeepCollectionEquality()
                    .equals(other.customDeck, customDeck)) &&
            (identical(other.seenIntro, seenIntro) ||
                const DeepCollectionEquality()
                    .equals(other.seenIntro, seenIntro)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(darkTheme) ^
      const DeepCollectionEquality().hash(tapToReveal) ^
      const DeepCollectionEquality().hash(eggTimer) ^
      const DeepCollectionEquality().hash(vibration) ^
      const DeepCollectionEquality().hash(selectedDeck) ^
      const DeepCollectionEquality().hash(customDeck) ^
      const DeepCollectionEquality().hash(seenIntro);

  @override
  _$SettingsCopyWith<_Settings> get copyWith =>
      __$SettingsCopyWithImpl<_Settings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SettingsToJson(this);
  }
}

abstract class _Settings implements Settings {
  factory _Settings(
      {bool darkTheme,
      bool tapToReveal,
      double eggTimer,
      bool vibration,
      DeckType selectedDeck,
      List<String> customDeck,
      bool seenIntro}) = _$_Settings;

  factory _Settings.fromJson(Map<String, dynamic> json) = _$_Settings.fromJson;

  @override
  bool get darkTheme;
  @override
  bool get tapToReveal;
  @override
  double get eggTimer;
  @override
  bool get vibration;
  @override
  DeckType get selectedDeck;
  @override
  List<String> get customDeck;
  @override
  bool get seenIntro;
  @override
  _$SettingsCopyWith<_Settings> get copyWith;
}
