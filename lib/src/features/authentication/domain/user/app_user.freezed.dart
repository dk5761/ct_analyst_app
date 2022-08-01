// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$User {
  AppUser get user => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({AppUser user, String token});

  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call({AppUser user, String token});

  @override
  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_$_User(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_User implements _User {
  _$_User({required this.user, required this.token});

  @override
  final AppUser user;
  @override
  final String token;

  @override
  String toString() {
    return 'User(user: $user, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);
}

abstract class _User implements User {
  factory _User({required final AppUser user, required final String token}) =
      _$_User;

  @override
  AppUser get user;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppUser {
  String get csslId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res>;
  $Res call({String csslId, String firstName, String lastName, bool isAdmin});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  final AppUser _value;
  // ignore: unused_field
  final $Res Function(AppUser) _then;

  @override
  $Res call({
    Object? csslId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? isAdmin = freezed,
  }) {
    return _then(_value.copyWith(
      csslId: csslId == freezed
          ? _value.csslId
          : csslId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  $Res call({String csslId, String firstName, String lastName, bool isAdmin});
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res> extends _$AppUserCopyWithImpl<$Res>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, (v) => _then(v as _$_AppUser));

  @override
  _$_AppUser get _value => super._value as _$_AppUser;

  @override
  $Res call({
    Object? csslId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? isAdmin = freezed,
  }) {
    return _then(_$_AppUser(
      csslId: csslId == freezed
          ? _value.csslId
          : csslId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: isAdmin == freezed
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AppUser implements _AppUser {
  _$_AppUser(
      {required this.csslId,
      required this.firstName,
      required this.lastName,
      required this.isAdmin});

  @override
  final String csslId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final bool isAdmin;

  @override
  String toString() {
    return 'AppUser(csslId: $csslId, firstName: $firstName, lastName: $lastName, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            const DeepCollectionEquality().equals(other.csslId, csslId) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.isAdmin, isAdmin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(csslId),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(isAdmin));

  @JsonKey(ignore: true)
  @override
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);
}

abstract class _AppUser implements AppUser {
  factory _AppUser(
      {required final String csslId,
      required final String firstName,
      required final String lastName,
      required final bool isAdmin}) = _$_AppUser;

  @override
  String get csslId;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  bool get isAdmin;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
