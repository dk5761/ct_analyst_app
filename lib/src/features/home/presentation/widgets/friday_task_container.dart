import 'package:ct_analyst_app/src/common/custom_list_tile.dart';
import 'package:ct_analyst_app/src/features/home/domain/friday_task.dart';
import 'package:flutter/material.dart';

class FridayTaskContainer extends StatelessWidget {
  final FridayTask fridayTask;

  const FridayTaskContainer({
    Key? key,
    required this.fridayTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SeperateFridayModel> list = fridaySeperatorFunction(fridayTask);

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return CustomListTile(url: list[index].url, title: list[index].title);
      },
      itemCount: list.length,
    );
  }
}
