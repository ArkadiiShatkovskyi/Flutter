import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';

import 'package:job_app/models/Record.dart';
import 'package:job_app/widgets/AppTheme.dart';
import './PreviewOfEditedRecord.dart';
import './EditingOption.dart';

class EditRecordWidget extends StatefulWidget {
  final Record editItem;
  final user;

  const EditRecordWidget({this.editItem, this.user});

  @override
  _EditRecordWidgetState createState() => _EditRecordWidgetState();
}

class _EditRecordWidgetState extends State<EditRecordWidget> {
  var _date;
  TimeOfDay _startTime;
  TimeOfDay _endTime;
  var _workTime;
  var _rate;
  TextEditingController _rateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.editItem != null) {
        _date = widget.editItem.date;
        _startTime = TimeOfDay.now().replacing(
            hour:
                int.parse(widget.editItem.startTime.toString().substring(0, 2)),
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
        _rateController.text = _rate.toString();
      }
    });
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
      height: media.size.height * .65,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 25,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          PreviewOfEditedRecord(
            date: _date,
            startTime: _startTime,
            endTime: _endTime,
            workTime: _workTime,
            rate: _rate,
          ),
          EditOption.optionWithButton(
            text: "Date: ",
            buttonText: 'Choose date',
            function: () => _showDatePicker(context),
          ),
          EditOption.optionWithButton(
            text: "Start time: ",
            buttonText: 'Choose time',
            function: () => _showTimePicker(context, true),
          ),
          EditOption.optionWithButton(
            text: "End time: ",
            buttonText: 'Choose time',
            function: () => _showTimePicker(context, false),
          ),
          EditOption.optionWithTextInput(
            text: "Rate: ",
            controller: _rateController,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(styleColor),
                  ),
                  onPressed: editRecord,
                  icon: const Icon(
                    AntIcons.edit_outline,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Edit record',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != _date && mounted)
      setState(() {
        _date = picked.toString().substring(5, 10);
      });
  }

  Future<Null> _showTimePicker(BuildContext context, bool startTime) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: startTime ? _startTime : _endTime,
    );
    if ((picked != null && picked != (startTime ? _startTime : _endTime)) &&
        mounted)
      setState(() {
        if (startTime)
          _startTime =
              _startTime.replacing(hour: picked.hour, minute: picked.minute);
        else
          _endTime =
              _endTime.replacing(hour: picked.hour, minute: picked.minute);
        _workTime = changeWorkTime();
      });
  }

  double changeWorkTime() {
    int startHour = _startTime.hour;
    int endHour = _endTime.hour <= 5 ? _endTime.hour + 24 : _endTime.hour;
    int startMinutes = _startTime.minute;
    int endMinutes = _endTime.minute;
    return (endHour + endMinutes / 60.0) - (startHour + startMinutes / 60.0);
  }

  void editRecord() {
    FirebaseFirestore.instance
        .collection(widget.user)
        .doc(widget.editItem.id)
        .update({
      'date': _date,
      'strTime':
          _startTime.toString().substring(10, _startTime.toString().length - 1),
      'endTime':
          _endTime.toString().substring(10, _endTime.toString().length - 1),
      'workTime': _workTime,
      'rate': double.parse(_rateController.text),
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: const Text('Record was edited'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
