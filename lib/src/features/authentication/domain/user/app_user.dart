// import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required AppUser user,
    required String token,
  }) = _User;
}

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    required String csslId,
    required String firstName,
    required String lastName,
    required bool isAdmin,
  }) = _AppUser;
}
