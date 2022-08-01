import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/custom_list_tile.dart';
import '../../../../constants/colors.dart';
import '../../data/dailyTaskRepo.dart';

class DailyTaskList extends ConsumerWidget {
  const DailyTaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(fetchDailyTaskProvider);
    return Column(
      children: taskList.when(
          data: (data) {
            return data
                .map(
                  (e) => CustomListTile(
                    url: e.url,
                    title: e.title,
                    imageUrl: e.imageUrl,
                  ),
                )
                .toList();
          },
          error: (error, _) {
            return const [
              Center(
                child: Text(
                  "Please check Internet Connection",
                  style: TextStyle(color: darkHeaderTextColor),
                ),
              ),
            ];
          },
          loading: () => [const Center(child: CircularProgressIndicator())]),
    );
  }
}
