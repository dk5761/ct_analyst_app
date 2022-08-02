// change it to riverpod class

import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatefulWidget {
  String value;

  CustomDropDown({Key? key, required this.value}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDown();
}

class _CustomDropDown extends State<CustomDropDown> {
  // String dropdownValue = 'Analyst';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.value,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      elevation: 16,
      style: const TextStyle(color: darkHeaderTextColor),
      underline: Container(
        height: 0,
        color: darkTextEnableFocusColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          widget.value = newValue!;
        });
      },
      items: <String>[
        'Analyst',
        'Tech Lead',
        'Team Coach',
        'Manager',
        'Manager Head',
        'Branch Head'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(padding: const EdgeInsets.all(8), child: Text(value)),
        );
      }).toList(),
    );
  }
}
