import 'package:ct_analyst_app/src/features/authentication/presentation/auth_screens/login_screen.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/auth_screens/register_screen.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/screen_holder/screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenScaffold extends ConsumerWidget {
  const ScreenScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLogin = ref.watch(screenProvider.notifier).state;

    return Scaffold(
      body: isLogin ? const LoginScreen() : const RegisterScreen(),
    );
  }
}
