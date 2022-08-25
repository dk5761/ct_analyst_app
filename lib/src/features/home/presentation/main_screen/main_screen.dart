import 'package:auto_route/auto_route.dart';
import 'package:ct_analyst_app/src/common/custom_button.dart';
import 'package:ct_analyst_app/src/constants/app_breakpoints.dart';
import 'package:ct_analyst_app/src/features/home/presentation/widgets/dailyTaskListWidget.dart';
import 'package:ct_analyst_app/src/routing/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/colors.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../data/fridayTaskRepo.dart';
import '../widgets/countdown.dart';
import '../widgets/friday_task_container.dart';
import '../widgets/timeZones.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final fridayTasks = ref.watch(fetchFridayTaskProvider);
    final currUser = ref.read(getCurrentUser);

    return currUser.when(
        data: (user) {
          final position = user!.user.position;

          return Container(
            color: darkSecondaryScaffoldBackgroundColor,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Tasks & Timer",
                        style: TextStyle(
                            color: darkHeaderTextColor,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (position == 0)
                      CustomButton(
                        label: "Go To DashBoard",
                        onPressed: () => AutoRouter.of(context)
                            .popAndPush(const DashboardRoute()),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const TimeZoneContainer(),
                const CountDown(),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Tasks",
                                  style: TextStyle(fontSize: 18),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    ref.refresh(fetchFridayTaskProvider);
                                  },
                                  child: const Icon(Icons.refresh),
                                )
                              ],
                            ),
                          ),
                          fridayTasks.when(
                              data: (data) => FridayTaskContainer(
                                    fridayTask: data,
                                  ),
                              error: (err, stack) => Text('Error: $err'),
                              loading: () => const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 12.0),
                                      child: Text(
                                        "Loading",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  )),
                          if (width < Breakpoint.breakpointMobile)
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              child: Text(
                                "Daily Task",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          if (width < Breakpoint.breakpointMobile)
                            const DailyTaskList()
                        ]),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, _) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
