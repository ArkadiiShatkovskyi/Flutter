import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';

import 'package:job_app/widgets/AppTheme.dart';

class EditRecordWidget extends StatelessWidget {
  final editItem;

  const EditRecordWidget({this.editItem});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return SingleChildScrollView(
        child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: appTheme.primaryColor),
      ),
      width: media.size.width * 1,
      height: media.size.height * .55,
      child: Column(
        children: <Widget>[
          DataTable(columnSpacing: 5, columns: [
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
                DataCell(Center(child: Text(editItem.date))),
                DataCell(Center(child: Text(editItem.startTime))),
                DataCell(Center(child: Text(editItem.endTime))),
                DataCell(Center(
                    child: Text(editItem.workTime.toString().length > 4
                        ? editItem.workTime.substring(0, 4)
                        : editItem.workTime))),
                DataCell(
                  Center(child: Text(editItem.rate)),
                )
              ],
            )
          ]),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    width: 75,
                    padding: EdgeInsets.only(top: 15),
                    child: Text("Date: ")),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    width: media.size.width * .35,
                    child: RaisedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          AntIcons.calendar_outline,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Choose date',
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    width: 75,
                    padding: EdgeInsets.only(top: 15),
                    child: Text("Start time: ")),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    width: media.size.width * .35,
                    child: RaisedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          AntIcons.clock_circle_outline,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Choose time',
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    width: 75,
                    padding: EdgeInsets.only(top: 15),
                    child: Text("End time: ")),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    width: media.size.width * .35,
                    child: RaisedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          AntIcons.clock_circle_outline,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Choose time',
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    width: 75,
                    padding: EdgeInsets.only(top: 15),
                    child: Text("Rate: ")),
                SizedBox(width: media.size.width * .3, child: TextFormField()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    AntIcons.edit_outline,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Choose time',
                    style: TextStyle(color: Colors.white),
                  )),
            ],),
          )
        ],
      ),
    ));
  }
}
