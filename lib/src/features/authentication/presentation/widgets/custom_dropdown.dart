// change it to riverpod class

import 'package:flutter/material.dart';

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
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
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
          child: Text(value),
        );
      }).toList(),
    );
  }
}
