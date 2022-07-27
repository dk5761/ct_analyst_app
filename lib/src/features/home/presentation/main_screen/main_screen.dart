// import 'package:dailytask/models/friday_task.dart';
// import 'package:dailytask/utils/constants.dart';
// import 'package:dailytask/widgets/countdown.dart';
// import 'package:dailytask/widgets/custom_list_tile.dart';
// import 'package:dailytask/widgets/friday_task_container.dart';
// import 'package:dailytask/widgets/timezones_container.dart';
import 'package:ct_analyst_app/src/constants/app_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/colors.dart';
import '../widgets/countdown.dart';
// import '../../main.dart';
// import '../../providers/friday_task_provider.dart';

class MainLarge extends ConsumerWidget {
  const MainLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    // final taskList = ref.read(listOfTaskProvider);
    // final fridayTasks = ref.watch(fridayTaskProvider);

    return Container(
      color: darkSecondaryScaffoldBackgroundColor,
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const TimeZoneContainer(),
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
                              // ref.refresh(fridayTaskProvider);
                            },
                            child: const Icon(Icons.refresh),
                          )
                        ],
                      ),
                    ),
                    // fridayTasks.when(
                    //     data: (data) => FridayTaskContainer(
                    //           fridayList: data,
                    //         ),
                    //     error: (err, stack) => Text('Error: $err'),
                    //     loading: () => const Center(
                    //           child: Padding(
                    //             padding: EdgeInsets.only(top: 12.0),
                    //             child: Text(
                    //               "Loading",
                    //               style: TextStyle(fontSize: 16),
                    //             ),
                    //           ),
                    //         )),

                    // ...fridayTasks!,
                    if (width < Breakpoint.breakpointMobile)
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        child: Text(
                          "Daily Task",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    // if (width < breakpointMobile)
                    // ...taskList
                    //     .map(
                    //       (e) => CustomListTile(
                    //         url: e.url,
                    //         title: e.title,
                    //         imageUrl: e.imageUrl,
                    //       ),
                    //     )
                    //     .toList()
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
