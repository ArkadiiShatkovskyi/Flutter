import 'dart:io';

import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';
import 'package:job_app/models/Record.dart';

import 'package:job_app/widgets/AppTheme.dart';

class EditRecordWidget extends StatefulWidget {
  final Record editItem;

  const EditRecordWidget({this.editItem});

  @override
  _EditRecordWidgetState createState() => _EditRecordWidgetState();
}

class _EditRecordWidgetState extends State<EditRecordWidget> {
  /*DateTime _date;
  TimeOfDay _startTime;
  TimeOfDay _endTime;
  double _workTime;
  double _rate;*/
  var _date;
  var _startTime;
  var _endTime;
  var _workTime;
  var _rate;

  @override
  void initState() {
    super.initState();
    _date = widget.editItem.date;
    _startTime = TimeOfDay.now().replacing(
        hour: int.parse(widget.editItem.startTime.toString().substring(0, 2)),
        minute: int.parse(widget.editItem.startTime
            .toString()
            .substring(3, widget.editItem.startTime.toString().length)));

    _endTime = TimeOfDay.now().replacing(
        hour: int.parse(widget.editItem.endTime.toString().substring(0, 2)),
        minute: int.parse(widget.editItem.endTime
            .toString()
            .substring(3, widget.editItem.endTime.toString().length)));
    _workTime = widget.editItem.workTime;
    _rate = widget.editItem.rate;
  }

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
                DataCell(Center(
                    child: Text(
                  _date,
                ))),
                DataCell(Center(
                    child: Text(
                  _startTime
                      .toString()
                      .substring(10, _startTime.toString().length - 1),
                ))),
                DataCell(Center(
                    child: Text(
                  _endTime
                      .toString()
                      .substring(10, _endTime.toString().length - 1),
                ))),
                DataCell(Center(
                    child: Text(
                  _workTime,
                ))),
                DataCell(
                  Center(
                      child: Text(
                    _rate,
                  )),
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
                        onPressed: () => _showDatePicker(context),
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
                        onPressed: () => _showTimePicker(context, true),
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
                        onPressed: () => _showTimePicker(context, false),
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
              ],
            ),
          )
        ],
      ),
    ));
  }

  Future<Null> _showDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        initialDatePickerMode: DatePickerMode.day,
        context: context,
//        initialDate: _date,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != _date)
      setState(() {
        _date = picked;
      });
  }

  Future<Null> _showTimePicker(BuildContext context, bool startTime) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
//      initialTime: startTime ? _startTime : _endTime,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != (startTime ? _startTime : _endTime))
      setState(() {
        if (startTime)
          _startTime = picked;
        else
          _endTime = picked;
      });
  }
}
