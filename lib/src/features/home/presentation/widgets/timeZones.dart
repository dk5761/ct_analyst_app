import 'package:flutter/material.dart';

import 'timeZone_clock.dart';

class TimeZoneContainer extends StatelessWidget {
  static const timezones = ["PST", "MST", "CST", "EST"];

  const TimeZoneContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: timezones
            .map((e) => TimeZoneClock(
                  title: e,
                ))
            .toList(),
      ),
    );
  }
}
