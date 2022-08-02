// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../features/authentication/presentation/screen_holder/screen_scaffold.dart'
    as _i2;
import '../features/dashboard/presentation/dashboard_screen.dart' as _i4;
import '../features/home/presentation/home_screen.dart' as _i1;
import '../features/home/presentation/main_screen/main_screen.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ScreenScaffold.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ScreenScaffold());
    },
    MainScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MainScreen());
    },
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DashboardPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i5.RouteConfig('#redirect',
              path: '',
              parent: HomeRoute.name,
              redirectTo: 'main',
              fullMatch: true),
          _i5.RouteConfig(MainScreen.name,
              path: 'main', parent: HomeRoute.name),
          _i5.RouteConfig(DashboardRoute.name,
              path: 'dashboard', parent: HomeRoute.name)
        ]),
        _i5.RouteConfig(ScreenScaffold.name, path: '/auth')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.ScreenScaffold]
class ScreenScaffold extends _i5.PageRouteInfo<void> {
  const ScreenScaffold() : super(ScreenScaffold.name, path: '/auth');

  static const String name = 'ScreenScaffold';
}

/// generated route for
/// [_i3.MainScreen]
class MainScreen extends _i5.PageRouteInfo<void> {
  const MainScreen() : super(MainScreen.name, path: 'main');

  static const String name = 'MainScreen';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: 'dashboard');

  static const String name = 'DashboardRoute';
}
