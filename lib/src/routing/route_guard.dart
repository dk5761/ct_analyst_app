import 'package:auto_route/auto_route.dart';
import 'package:ct_analyst_app/src/features/authentication/data/auth_repository.dart';
import 'package:ct_analyst_app/src/routing/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouteGuard extends AutoRedirectGuard {
  RouteGuard(this.read);

  final Reader read;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // if (read(authRepositoryProvider).currentUser!.user.position == 0) {
    //   return resolver.next();
    // }
    // router.push(const DashboardRoute());
    return resolver.next();
  }

  @override
  Future<bool> canNavigate(RouteMatch route) {
    // TODO: implement canNavigate
    throw UnimplementedError();
  }
}
