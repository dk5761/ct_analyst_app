import 'package:ct_analyst_app/src/features/dashboard/data/dashboard_repository.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/widgets/fixed_column.dart';
import 'package:ct_analyst_app/src/features/dashboard/presentation/widgets/scrollable_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableGenerator extends ConsumerWidget {
  const TableGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getUserDashboard = ref.watch(fetchDashboardData);

    return getUserDashboard.when(
        data: (data) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  FixedColumnWidget(data: const [
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
        },
        error: (err, _) => Text(err.toString()),
        loading: () => const CircularProgressIndicator());
  }
}


// SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columns: [
//                   const DataColumn(label: Text("")),
//                   ...data!.monthList!.map((e) => DataColumn(label: Text(e)))
//                 ],
//                 rows: [
//                   DataRow(cells: [
//                     const DataCell(Text("CSAT")),
//                     ...data.csat!.map((e) => DataCell(Text(e.toString())))
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text("Communication")),
//                     ...data.communication!
//                         .map((e) => DataCell(Text(e.toString())))
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text("Survey Count")),
//                     ...data.surveyCount!
//                         .map((e) => DataCell(Text(e.toString())))
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text("Closed Cases")),
//                     ...data.closedCase!.map((e) => DataCell(Text(e.toString())))
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text("ATR Days")),
//                     ...data.atrDays!.map((e) => DataCell(Text(e.toString())))
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text("Owned Cases")),
//                     ...data.ownedCases!.map((e) => DataCell(Text(e.toString())))
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text("Adherance")),
//                     ...data.adherance!.map((e) => DataCell(Text(e.toString())))
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text("Timeouts Phone")),
//                     ...data.timeoutsPhone!
//                         .map((e) => DataCell(Text(e.toString())))
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text("Timeouts Chat")),
//                     ...data.timeoutsChat!
//                         .map((e) => DataCell(Text(e.toString())))
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text("Late Logins")),
//                     ...data.lateLogins!.map((e) => DataCell(Text(e.toString())))
//                   ]),
//                   DataRow(cells: [
//                     const DataCell(Text("Coverage")),
//                     ...data.coverage!.map((e) => DataCell(Text(e.toString())))
//                   ]),
//                 ],
//               ),
//             ),