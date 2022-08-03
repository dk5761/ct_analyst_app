import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ct_analyst_app/src/features/authentication/presentation/screen_holder/screen_scaffold.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:ct_analyst_app/src/features/home/presentation/home_screen.dart';
import 'package:ct_analyst_app/src/features/home/presentation/main_screen/position_wrapper.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/home',
      page: HomePage,
      maintainState: true,
      children: [
        CustomRoute(
            path: 'main',
            page: PositionWrapper,
            initial: true,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: 0),
        CustomRoute(
            path: 'dashboard',
            page: DashboardPage,
            transitionsBuilder: TransitionsBuilders.slideRightWithFade,
            durationInMilliseconds: 0),
      ],
    ),
    AutoRoute(path: '/auth', page: ScreenScaffold),
  ],
)
class $AppRouter {}
