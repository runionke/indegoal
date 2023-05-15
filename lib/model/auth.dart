import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:indegoal/lib.dart';

part 'auth.freezed.dart';

@freezed
class Auth with _$Auth {
  const factory Auth.authorized(User user) = Authorized;
  const factory Auth.unauthorized() = Unauthorized;
  const factory Auth.loading() = AuthLoading;
}
