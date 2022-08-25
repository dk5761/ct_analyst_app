import 'dart:convert';

import 'package:ct_analyst_app/src/features/authentication/domain/user/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  AuthService(this.ref);

  final storage = const FlutterSecureStorage();
  final ProviderRef ref;

  Future<void> addToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  Future<String?> getToken() async {
    String? value = await storage.read(key: "token");
    return value;
  }

  Future<void> removeToken() async {
    await storage.delete(key: "token");
  }

  Future<void> saveUser(User user) async {
    await storage.write(key: "user", value: json.encode(user.toJson()));
  }

  Future<User?> getUser() async {
    final userString = await storage.read(key: "user") ?? "";
    final user = json.decode(userString);
    return User.fromJson(user);
  }

  Future<void> deleteUser() async {
    return await storage.delete(key: "user");
  }

  Future<int> getPositionInt(String value) async {
    switch (value) {
      case 'Analyst':
        return 0;
      case 'Tech Lead':
        return 1;
      case 'Team Coach':
        return 2;
      case 'Manager':
        return 3;
      case 'Manager Head':
        return 4;
      case 'Branch Head':
        return 5;
      default:
        return 0;
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService(ref));

final userProvider = FutureProvider((ref) async {
  final repo = ref.watch(authServiceProvider);
  return await repo.getUser();
});
