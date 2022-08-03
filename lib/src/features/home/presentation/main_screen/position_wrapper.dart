import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:ct_analyst_app/src/features/authentication/data/auth_repository.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:ct_analyst_app/src/features/home/presentation/main_screen/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class PositionWrapper extends ConsumerWidget {
  const PositionWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position =
        ref.read(authRepositoryProvider).currentUser!.user.position;

    if (position == 0) {
      return const MainScreen();
    }

    return const DashboardPage();
  }
}
