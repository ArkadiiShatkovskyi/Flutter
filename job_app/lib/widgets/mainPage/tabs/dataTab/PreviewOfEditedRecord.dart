import 'package:flutter/material.dart';

class PreviewOfEditedRecord extends StatelessWidget {
  final date;
  final startTime;
  final endTime;
  final workTime;
  final rate;

  const PreviewOfEditedRecord({
    this.date,
    this.startTime,
    this.endTime,
    this.workTime,
    this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(columnSpacing: 5, columns: [
      DataColumn(
        label: const Text("Date"),
      ),
      DataColumn(
        label: const Text("Start time"),
      ),
      DataColumn(
        label: const Text("End time"),
      ),
      DataColumn(
        label: const Text("Work time"),
      ),
      DataColumn(
        label: const Text("Rate"),
      ),
    ], rows: [
      DataRow(
        cells: [
          DataCell(Center(
              child: Text(
            date,
          ))),
          DataCell(Center(
              child: Text(
            startTime.toString().substring(10, startTime.toString().length - 1),
          ))),
          DataCell(Center(
              child: Text(
            endTime.toString().substring(10, endTime.toString().length - 1),
          ))),
          DataCell(Center(
              child: Text(
            workTime.toString().length > 4
                ? workTime.toString().substring(0, 4)
                : workTime.toString(),
          ))),
          DataCell(
            Center(
                child: Text(
              rate.toString(),
            )),
          )
        ],
      )
    ]);
  }
}
