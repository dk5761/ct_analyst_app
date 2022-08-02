import 'package:ct_analyst_app/src/features/authentication/application/auth_local_service.dart';
import 'package:ct_analyst_app/src/features/authentication/data/auth_repository.dart';
import 'package:ct_analyst_app/src/features/authentication/domain/auth_state/auth_state.dart';
import 'package:ct_analyst_app/src/utils/functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController({required this.read, required this.authRepository})
      : super(const AuthState.initial());

  final Reader read;
  final AuthRepository authRepository;

  Future<void> login(String csslId, String password) async {
    state = const AuthState.loading();
    try {
      final data = await authRepository.login(csslId, password);
      await read(authServiceProvider).addToken(data.token);
      state = const AuthState.loggedIn();
    } catch (err) {
      logger.e(err);
      state = const AuthState.error();
    }
  }

  Future<void> register(String csslId, String firstName, String lastName,
      String password, int position) async {
    state = const AuthState.loading();
    try {
      final data = await authRepository.register(
          csslId, firstName, lastName, password, position);
      await read(authServiceProvider).addToken(data.token);
      state = const AuthState.loggedIn();
    } catch (err) {
      logger.e(err);
      state = const AuthState.error();
    }
  }

  Future<void> signOut() async {
    try {
      await authRepository.signOut();
      await read(authServiceProvider).removeToken();
      state = const AuthState.initial();
    } catch (err) {
      logger.e(err);
      state = const AuthState.error();
    }
  }
}

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(
      authRepository: ref.read(authRepositoryProvider), read: ref.read);
});
