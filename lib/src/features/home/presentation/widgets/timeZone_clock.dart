// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/colors.dart';

class TimeZoneClock extends StatefulWidget {
  final String title;

  const TimeZoneClock({Key? key, required this.title}) : super(key: key);

  @override
  State<TimeZoneClock> createState() => _TimeZoneClockState();
}

class _TimeZoneClockState extends State<TimeZoneClock> {
  late Timer timer;
  static const duration = Duration(seconds: 1);
  late DateTime current;

  @override
  void initState() {
    super.initState();
    current = DateTime.now();
    timeZoneCalculator(widget.title);
    timer = Timer.periodic(duration, (Timer t) {
      handleTick();
    });
  }

  DateTime timeZoneCalculator(String tz) {
    if (current.timeZoneName == "Pacific Daylight Time" ||
        current.timeZoneName == "Pacific Standard Time") {
      if (widget.title == "PST") {
        return current;
      }
    }

    switch (tz) {
      case "CST":
        current = current.add(const Duration(hours: 2));
        break;

      case "MST":
        current = current.add(const Duration(hours: 1));
        break;

      case "EST":
        current = current.add(const Duration(hours: 3));
        break;
    }

    return current;
  }

  void handleTick() {
    if (mounted) {
      setState(() {
        current = current.add(duration);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat.Hm().format(current),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.title,
          style: const TextStyle(
              color: darkHeaderTextColor, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
