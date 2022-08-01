import 'package:ct_analyst_app/src/features/home/data/dailyTaskRepo.dart';
import 'package:ct_analyst_app/src/features/home/presentation/widgets/dailyTaskListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SidePanel extends ConsumerStatefulWidget {
  const SidePanel({Key? key}) : super(key: key);

  @override
  SidePanelState createState() => SidePanelState();
}

class SidePanelState extends ConsumerState<SidePanel> {
  @override
  Widget build(BuildContext context) {
    // final taskList = ref.watch(fetchDailyTaskProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: DailyTaskList(),
      ),
    );
  }
}
