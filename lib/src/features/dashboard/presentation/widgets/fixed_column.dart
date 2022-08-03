import 'package:ct_analyst_app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class FixedColumnWidget extends StatelessWidget {
  final List<String> data;
  const FixedColumnWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 10,
      headingRowColor: MaterialStateProperty.all(darkButtonBackgroundColor),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: darkHeaderTextColor,
            width: 2,
          ),
        ),
      ),
      columns: const [
        DataColumn(label: Text('Params')),
      ],
      rows: [
        ...data.map((e) => DataRow(
              cells: [
                DataCell(Text(
                  e,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ))
      ],
    );
  }
}
