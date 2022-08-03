import 'package:ct_analyst_app/src/constants/colors.dart';
import 'package:ct_analyst_app/src/features/dashboard/domain/dashboard_data.dart';
import 'package:flutter/material.dart';

class ScrollableColumnWidget extends StatelessWidget {
  final DashboardData data;

  const ScrollableColumnWidget({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(darkButtonBackgroundColor),
          columnSpacing: 40,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          columns: [...data.monthList!.map((e) => DataColumn(label: Text(e)))],
          rows: [
            DataRow(cells: [
              ...data.csat!.map((e) => DataCell(Text(e.toString())))
            ]),
            DataRow(cells: [
              ...data.communication!.map((e) => DataCell(Text(e.toString())))
            ]),
            DataRow(cells: [
              ...data.surveyCount!.map((e) => DataCell(Text(e.toString())))
            ]),
            DataRow(cells: [
              ...data.closedCase!.map((e) => DataCell(Text(e.toString())))
            ]),
            DataRow(cells: [
              ...data.atrDays!.map((e) => DataCell(Text(e.toString())))
            ]),
            DataRow(cells: [
              ...data.ownedCases!.map((e) => DataCell(Text(e.toString())))
            ]),
            DataRow(cells: [
              ...data.adherance!.map((e) => DataCell(Text(e.toString())))
            ]),
            DataRow(cells: [
              ...data.timeoutsPhone!.map((e) => DataCell(Text(e.toString())))
            ]),
            DataRow(cells: [
              ...data.timeoutsChat!.map((e) => DataCell(Text(e.toString())))
            ]),
            DataRow(cells: [
              ...data.lateLogins!.map((e) => DataCell(Text(e.toString())))
            ]),
            DataRow(cells: [
              ...data.coverage!.map((e) => DataCell(Text(e.toString())))
            ]),
          ],
        ),
      ),
    );
  }
}
