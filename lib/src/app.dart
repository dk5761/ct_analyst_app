import 'package:auto_route/auto_route.dart';
import 'package:ct_analyst_app/src/features/authentication/domain/auth_state/auth_state.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/auth_screens/auth_controller.dart';
import 'package:ct_analyst_app/src/routing/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/theme_provider.dart';
import 'utils/scroll_behavior.dart';

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authProvider);

    return Builder(builder: (context) {
      return MaterialApp.router(
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: 'Daily Task',
          theme: ref.watch(theme),
          darkTheme: ref.watch(darkTheme),
          themeMode: ThemeMode.dark,
          routerDelegate: AutoRouterDelegate.declarative(
            appRouter,
            routes: (_) {
              return [
                // if the user is logged in, they may proceed to the main App
                if (currentUser == const AuthState.loggedIn())
                  const HomeRoute()

                // if they are not logged in, bring them to the Login page
                else
                  const ScreenScaffold()
              ];
            },
          ),
          routeInformationParser: appRouter.defaultRouteParser());
    });
  }
}
