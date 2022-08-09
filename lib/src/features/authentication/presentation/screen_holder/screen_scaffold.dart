import 'package:ct_analyst_app/src/features/authentication/domain/auth_state/auth_state.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/auth_screens/login_screen.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/auth_screens/register_screen.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/screen_holder/screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import '../auth_screens/auth_controller.dart';

class ScreenScaffold extends ConsumerWidget {
  const ScreenScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogin = ref.watch(screenProvider);
    ref.listen(authProvider, (_, state) {
      const snackBar = SnackBar(
        content: Text(
          'Invalid Credentials',
          style: TextStyle(color: Colors.red),
        ),
      );
      if (state == const AuthState.error()) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kWindowCaptionHeight),
        child: WindowCaption(
          brightness: Theme.of(context).brightness,
          title: const Text('Daily Task'),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        child: isLogin ? const LoginScreen() : const RegisterScreen(),
      ),
      // firstCurve: Curves.easeInBack,
    );
  }
}
