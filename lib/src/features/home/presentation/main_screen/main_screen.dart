// import 'package:dailytask/models/friday_task.dart';
// import 'package:dailytask/utils/constants.dart';
// import 'package:dailytask/widgets/countdown.dart';
// import 'package:dailytask/widgets/custom_list_tile.dart';
// import 'package:dailytask/widgets/friday_task_container.dart';
// import 'package:dailytask/widgets/timezones_container.dart';
import 'package:ct_analyst_app/src/constants/app_breakpoints.dart';
import 'package:ct_analyst_app/src/features/home/presentation/widgets/dailyTaskListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/colors.dart';
import '../../data/fridayTaskRepo.dart';
import '../widgets/countdown.dart';
import '../widgets/friday_task_container.dart';
import '../widgets/timeZones.dart';
// import '../../main.dart';
// import '../../providers/friday_task_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    // final taskList = ref.read(listOfTaskProvider);
    // final fridayTasks = ref.watch(fridayTaskProvider);
    final fridayTasks = ref.watch(fetchFridayTaskProvider);

    return Container(
      color: darkSecondaryScaffoldBackgroundColor,
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
  }
}
