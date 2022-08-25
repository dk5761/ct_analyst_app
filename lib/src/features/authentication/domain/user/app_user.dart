// import 'package:flutter_boilerplate/shared/http/app_exception.dart';
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class User with _$User {
  factory User({
    required AppUser user,
    required String token,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    required String csslId,
    required String firstName,
    required String lastName,
    required int position,
    required bool isAdmin,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);
}
