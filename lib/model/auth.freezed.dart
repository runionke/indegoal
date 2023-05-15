// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Auth {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authorized,
    required TResult Function() unauthorized,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authorized,
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authorized,
    TResult Function()? unauthorized,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authorized value) authorized,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(AuthLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authorized value)? authorized,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(AuthLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authorized value)? authorized,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(AuthLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) then) =
      _$AuthCopyWithImpl<$Res, Auth>;
}

/// @nodoc
class _$AuthCopyWithImpl<$Res, $Val extends Auth>
    implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthorizedCopyWith<$Res> {
  factory _$$AuthorizedCopyWith(
          _$Authorized value, $Res Function(_$Authorized) then) =
      __$$AuthorizedCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthorizedCopyWithImpl<$Res>
    extends _$AuthCopyWithImpl<$Res, _$Authorized>
    implements _$$AuthorizedCopyWith<$Res> {
  __$$AuthorizedCopyWithImpl(
      _$Authorized _value, $Res Function(_$Authorized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$Authorized(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$Authorized implements Authorized {
  const _$Authorized(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'Auth.authorized(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Authorized &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizedCopyWith<_$Authorized> get copyWith =>
      __$$AuthorizedCopyWithImpl<_$Authorized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authorized,
    required TResult Function() unauthorized,
    required TResult Function() loading,
  }) {
    return authorized(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authorized,
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
  }) {
    return authorized?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authorized,
    TResult Function()? unauthorized,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authorized value) authorized,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(AuthLoading value) loading,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authorized value)? authorized,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(AuthLoading value)? loading,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authorized value)? authorized,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(AuthLoading value)? loading,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class Authorized implements Auth {
  const factory Authorized(final User user) = _$Authorized;

  User get user;
  @JsonKey(ignore: true)
  _$$AuthorizedCopyWith<_$Authorized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedCopyWith<$Res> {
  factory _$$UnauthorizedCopyWith(
          _$Unauthorized value, $Res Function(_$Unauthorized) then) =
      __$$UnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedCopyWithImpl<$Res>
    extends _$AuthCopyWithImpl<$Res, _$Unauthorized>
    implements _$$UnauthorizedCopyWith<$Res> {
  __$$UnauthorizedCopyWithImpl(
      _$Unauthorized _value, $Res Function(_$Unauthorized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unauthorized implements Unauthorized {
  const _$Unauthorized();

  @override
  String toString() {
    return 'Auth.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authorized,
    required TResult Function() unauthorized,
    required TResult Function() loading,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authorized,
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authorized,
    TResult Function()? unauthorized,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authorized value) authorized,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(AuthLoading value) loading,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authorized value)? authorized,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(AuthLoading value)? loading,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authorized value)? authorized,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(AuthLoading value)? loading,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized implements Auth {
  const factory Unauthorized() = _$Unauthorized;
}

/// @nodoc
abstract class _$$AuthLoadingCopyWith<$Res> {
  factory _$$AuthLoadingCopyWith(
          _$AuthLoading value, $Res Function(_$AuthLoading) then) =
      __$$AuthLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingCopyWithImpl<$Res>
    extends _$AuthCopyWithImpl<$Res, _$AuthLoading>
    implements _$$AuthLoadingCopyWith<$Res> {
  __$$AuthLoadingCopyWithImpl(
      _$AuthLoading _value, $Res Function(_$AuthLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoading implements AuthLoading {
  const _$AuthLoading();

  @override
  String toString() {
    return 'Auth.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authorized,
    required TResult Function() unauthorized,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authorized,
    TResult? Function()? unauthorized,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authorized,
    TResult Function()? unauthorized,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authorized value) authorized,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(AuthLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authorized value)? authorized,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(AuthLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authorized value)? authorized,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(AuthLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements Auth {
  const factory AuthLoading() = _$AuthLoading;
}
