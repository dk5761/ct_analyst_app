// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      csslId: json['csslId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      isAdmin: json['isAdmin'] as bool,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'csslId': instance.csslId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isAdmin': instance.isAdmin,
    };
