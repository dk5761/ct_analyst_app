import 'dart:ffi';

import 'package:ct_analyst_app/src/features/authentication/data/auth_repository.dart';
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

final getToken = FutureProvider(
  (ref) => ref.read(authServiceProvider).getToken(),
);
