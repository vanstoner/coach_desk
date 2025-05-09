// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'squad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Squad _$SquadFromJson(Map<String, dynamic> json) {
  return _Squad.fromJson(json);
}

/// @nodoc
mixin _$Squad {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get playerIds => throw _privateConstructorUsedError;
  String get captainId => throw _privateConstructorUsedError;

  /// Serializes this Squad to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Squad
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SquadCopyWith<Squad> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SquadCopyWith<$Res> {
  factory $SquadCopyWith(Squad value, $Res Function(Squad) then) =
      _$SquadCopyWithImpl<$Res, Squad>;
  @useResult
  $Res call({String id, String name, List<String> playerIds, String captainId});
}

/// @nodoc
class _$SquadCopyWithImpl<$Res, $Val extends Squad>
    implements $SquadCopyWith<$Res> {
  _$SquadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Squad
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? playerIds = null,
    Object? captainId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      playerIds: null == playerIds
          ? _value.playerIds
          : playerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      captainId: null == captainId
          ? _value.captainId
          : captainId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SquadImplCopyWith<$Res> implements $SquadCopyWith<$Res> {
  factory _$$SquadImplCopyWith(
          _$SquadImpl value, $Res Function(_$SquadImpl) then) =
      __$$SquadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, List<String> playerIds, String captainId});
}

/// @nodoc
class __$$SquadImplCopyWithImpl<$Res>
    extends _$SquadCopyWithImpl<$Res, _$SquadImpl>
    implements _$$SquadImplCopyWith<$Res> {
  __$$SquadImplCopyWithImpl(
      _$SquadImpl _value, $Res Function(_$SquadImpl) _then)
      : super(_value, _then);

  /// Create a copy of Squad
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? playerIds = null,
    Object? captainId = null,
  }) {
    return _then(_$SquadImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      playerIds: null == playerIds
          ? _value._playerIds
          : playerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      captainId: null == captainId
          ? _value.captainId
          : captainId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SquadImpl implements _Squad {
  const _$SquadImpl(
      {required this.id,
      required this.name,
      required final List<String> playerIds,
      required this.captainId})
      : _playerIds = playerIds;

  factory _$SquadImpl.fromJson(Map<String, dynamic> json) =>
      _$$SquadImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<String> _playerIds;
  @override
  List<String> get playerIds {
    if (_playerIds is EqualUnmodifiableListView) return _playerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerIds);
  }

  @override
  final String captainId;

  @override
  String toString() {
    return 'Squad(id: $id, name: $name, playerIds: $playerIds, captainId: $captainId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SquadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._playerIds, _playerIds) &&
            (identical(other.captainId, captainId) ||
                other.captainId == captainId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_playerIds), captainId);

  /// Create a copy of Squad
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SquadImplCopyWith<_$SquadImpl> get copyWith =>
      __$$SquadImplCopyWithImpl<_$SquadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SquadImplToJson(
      this,
    );
  }
}

abstract class _Squad implements Squad {
  const factory _Squad(
      {required final String id,
      required final String name,
      required final List<String> playerIds,
      required final String captainId}) = _$SquadImpl;

  factory _Squad.fromJson(Map<String, dynamic> json) = _$SquadImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  List<String> get playerIds;
  @override
  String get captainId;

  /// Create a copy of Squad
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SquadImplCopyWith<_$SquadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
