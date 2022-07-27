// import 'package:dailytask/widgets/custom_list_tile.dart';
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
    // final taskList = ref.read(listOfTaskProvider);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ...taskList
              //     .map(
              //       (e) => CustomListTile(
              //         url: e.url,
              //         title: e.title,
              //         imageUrl: e.imageUrl,
              //       ),
              //     )
              //     .toList()
            ],
          ),
        ));
  }
}
