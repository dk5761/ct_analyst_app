import 'package:ct_analyst_app/src/features/authentication/domain/user/app_user.dart';
import 'package:ct_analyst_app/src/utils/functions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IAuthRepository {
  Future<User> login(String email, String password);
  Future<User> register(String csslId, String firstName, String lastName,
      String password, int position);
  Future<void> signOut();
}

final clientProvider = Provider(
    (ref) => Dio(BaseOptions(baseUrl: "http://${dotenv.env['IP']}/user/")));

class AuthRepository implements IAuthRepository {
  AuthRepository(this.ref);

  final ProviderRef ref;

  User? _currentUser;
  User? get currentUser => _currentUser;

  @override
  Future<User> login(String csslId, String password) async {
    final response = await ref
        .read(clientProvider)
        .post('login', data: {"csslId": csslId, "password": password});

    _currentUser = User.fromJson(response.data);
    return User.fromJson(response.data);
  }

  @override
  Future<User> register(String csslId, String password, String firstName,
      String lastName, int position) async {
    final response = await ref.read(clientProvider).post('register', data: {
      "csslId": csslId,
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
      "position": position
    });

    _currentUser = User.fromJson(response.data);

    return User.fromJson(response.data);
  }

  @override
  Future<void> signOut() async {
    _currentUser = null;
  }
}

final authRepositoryProvider = Provider((ref) => AuthRepository(ref));

final currentUserProvider =
    Provider((ref) => ref.watch(authRepositoryProvider).currentUser);
