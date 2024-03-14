// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProviderState {
  List<UserEntity>? get users => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProviderStateCopyWith<UserProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProviderStateCopyWith<$Res> {
  factory $UserProviderStateCopyWith(
          UserProviderState value, $Res Function(UserProviderState) then) =
      _$UserProviderStateCopyWithImpl<$Res, UserProviderState>;
  @useResult
  $Res call({List<UserEntity>? users, bool isLoading});
}

/// @nodoc
class _$UserProviderStateCopyWithImpl<$Res, $Val extends UserProviderState>
    implements $UserProviderStateCopyWith<$Res> {
  _$UserProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProviderStateImplCopyWith<$Res>
    implements $UserProviderStateCopyWith<$Res> {
  factory _$$UserProviderStateImplCopyWith(_$UserProviderStateImpl value,
          $Res Function(_$UserProviderStateImpl) then) =
      __$$UserProviderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserEntity>? users, bool isLoading});
}

/// @nodoc
class __$$UserProviderStateImplCopyWithImpl<$Res>
    extends _$UserProviderStateCopyWithImpl<$Res, _$UserProviderStateImpl>
    implements _$$UserProviderStateImplCopyWith<$Res> {
  __$$UserProviderStateImplCopyWithImpl(_$UserProviderStateImpl _value,
      $Res Function(_$UserProviderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$UserProviderStateImpl(
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserProviderStateImpl implements _UserProviderState {
  _$UserProviderStateImpl(
      {required final List<UserEntity>? users, required this.isLoading})
      : _users = users;

  final List<UserEntity>? _users;
  @override
  List<UserEntity>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'UserProviderState(users: $users, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProviderStateImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_users), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProviderStateImplCopyWith<_$UserProviderStateImpl> get copyWith =>
      __$$UserProviderStateImplCopyWithImpl<_$UserProviderStateImpl>(
          this, _$identity);
}

abstract class _UserProviderState implements UserProviderState {
  factory _UserProviderState(
      {required final List<UserEntity>? users,
      required final bool isLoading}) = _$UserProviderStateImpl;

  @override
  List<UserEntity>? get users;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$UserProviderStateImplCopyWith<_$UserProviderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
