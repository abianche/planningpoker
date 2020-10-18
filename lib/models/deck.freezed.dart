// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'deck.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Deck _$DeckFromJson(Map<String, dynamic> json) {
  return _Deck.fromJson(json);
}

/// @nodoc
class _$DeckTearOff {
  const _$DeckTearOff();

// ignore: unused_element
  _Deck call(
      {String name,
      String image,
      String color,
      String colorDark,
      List<String> values}) {
    return _Deck(
      name: name,
      image: image,
      color: color,
      colorDark: colorDark,
      values: values,
    );
  }

// ignore: unused_element
  Deck fromJson(Map<String, Object> json) {
    return Deck.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Deck = _$DeckTearOff();

/// @nodoc
mixin _$Deck {
  String get name;
  String get image;
  String get color;
  String get colorDark;
  List<String> get values;

  Map<String, dynamic> toJson();
  $DeckCopyWith<Deck> get copyWith;
}

/// @nodoc
abstract class $DeckCopyWith<$Res> {
  factory $DeckCopyWith(Deck value, $Res Function(Deck) then) =
      _$DeckCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String image,
      String color,
      String colorDark,
      List<String> values});
}

/// @nodoc
class _$DeckCopyWithImpl<$Res> implements $DeckCopyWith<$Res> {
  _$DeckCopyWithImpl(this._value, this._then);

  final Deck _value;
  // ignore: unused_field
  final $Res Function(Deck) _then;

  @override
  $Res call({
    Object name = freezed,
    Object image = freezed,
    Object color = freezed,
    Object colorDark = freezed,
    Object values = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      image: image == freezed ? _value.image : image as String,
      color: color == freezed ? _value.color : color as String,
      colorDark: colorDark == freezed ? _value.colorDark : colorDark as String,
      values: values == freezed ? _value.values : values as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$DeckCopyWith<$Res> implements $DeckCopyWith<$Res> {
  factory _$DeckCopyWith(_Deck value, $Res Function(_Deck) then) =
      __$DeckCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String image,
      String color,
      String colorDark,
      List<String> values});
}

/// @nodoc
class __$DeckCopyWithImpl<$Res> extends _$DeckCopyWithImpl<$Res>
    implements _$DeckCopyWith<$Res> {
  __$DeckCopyWithImpl(_Deck _value, $Res Function(_Deck) _then)
      : super(_value, (v) => _then(v as _Deck));

  @override
  _Deck get _value => super._value as _Deck;

  @override
  $Res call({
    Object name = freezed,
    Object image = freezed,
    Object color = freezed,
    Object colorDark = freezed,
    Object values = freezed,
  }) {
    return _then(_Deck(
      name: name == freezed ? _value.name : name as String,
      image: image == freezed ? _value.image : image as String,
      color: color == freezed ? _value.color : color as String,
      colorDark: colorDark == freezed ? _value.colorDark : colorDark as String,
      values: values == freezed ? _value.values : values as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Deck with DiagnosticableTreeMixin implements _Deck {
  const _$_Deck(
      {this.name, this.image, this.color, this.colorDark, this.values});

  factory _$_Deck.fromJson(Map<String, dynamic> json) =>
      _$_$_DeckFromJson(json);

  @override
  final String name;
  @override
  final String image;
  @override
  final String color;
  @override
  final String colorDark;
  @override
  final List<String> values;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Deck(name: $name, image: $image, color: $color, colorDark: $colorDark, values: $values)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Deck'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('colorDark', colorDark))
      ..add(DiagnosticsProperty('values', values));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Deck &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.colorDark, colorDark) ||
                const DeepCollectionEquality()
                    .equals(other.colorDark, colorDark)) &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(colorDark) ^
      const DeepCollectionEquality().hash(values);

  @override
  _$DeckCopyWith<_Deck> get copyWith =>
      __$DeckCopyWithImpl<_Deck>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DeckToJson(this);
  }
}

abstract class _Deck implements Deck {
  const factory _Deck(
      {String name,
      String image,
      String color,
      String colorDark,
      List<String> values}) = _$_Deck;

  factory _Deck.fromJson(Map<String, dynamic> json) = _$_Deck.fromJson;

  @override
  String get name;
  @override
  String get image;
  @override
  String get color;
  @override
  String get colorDark;
  @override
  List<String> get values;
  @override
  _$DeckCopyWith<_Deck> get copyWith;
}
