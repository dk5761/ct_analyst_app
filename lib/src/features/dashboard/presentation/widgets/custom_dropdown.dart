// change it to riverpod class

import 'package:ct_analyst_app/src/features/dashboard/data/dashboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/colors.dart';

// ignore: must_be_immutable
class CustomDropDown extends ConsumerStatefulWidget {
  List<dynamic>? names;
  String? value;

  CustomDropDown({
    Key? key,
    required this.value,
    required this.names,
  }) : super(key: key);

  @override
  CustomDropDownState createState() => CustomDropDownState();
}

class CustomDropDownState extends ConsumerState<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: ref.watch(dropItemProvider),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        elevation: 16,
        style: const TextStyle(color: darkHeaderTextColor),
        underline: Container(
          height: 0,
          color: darkTextEnableFocusColor,
        ),
        onChanged: (String? newValue) {
          ref.read(dropItemProvider.notifier).state = newValue as String;
          ref.refresh(fetchDashboardData);
          setState(() {
            widget.value = newValue;
          });
        },
        items: [
          const DropdownMenuItem(
            value: "Select analyst Name",
            child: Text("Select analyst Name"),
          ),
          ...widget.names!.map<DropdownMenuItem<String>>((dynamic value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(value as String)),
            );
          }).toList(),
        ]);
  }
}

final dropItemProvider = StateProvider<String>((ref) => "Select analyst Name");
