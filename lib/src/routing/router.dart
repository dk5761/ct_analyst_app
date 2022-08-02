import 'package:auto_route/annotations.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/screen_holder/screen_scaffold.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:ct_analyst_app/src/features/home/presentation/home_screen.dart';
import 'package:ct_analyst_app/src/features/home/presentation/main_screen/main_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/home',
      page: HomePage,
      children: [
        AutoRoute(path: 'main', page: MainScreen, initial: true),
        AutoRoute(path: 'dashboard', page: DashboardPage),
      ],
    ),
    AutoRoute(path: '/auth', page: ScreenScaffold),
  ],
)
class $AppRouter {}
