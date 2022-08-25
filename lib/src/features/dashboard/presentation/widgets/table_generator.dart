import 'package:ct_analyst_app/src/features/dashboard/data/dashboard_repository.dart';
import 'package:ct_analyst_app/src/features/dashboard/domain/dashboard_data.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/widgets/fixed_column.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/widgets/scrollable_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableGenerator extends ConsumerWidget {
  final DashboardData? data;
  const TableGenerator({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return data == null
        ? const Text("Select an Analyst from the drop down")
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              children: [
                const FixedColumnWidget(data: [
                  "csat",
                  "communication",
                  "surveyCount",
                  "closedCase",
                  "atrDays",
                  "ownedCases",
                  "adherance",
                  "timeoutsPhone",
                  "timeoutsChat",
                  "lateLogins",
                  "coverage"
                ]),
                ScrollableColumnWidget(data: data!)
              ],
            ));
  }
}
