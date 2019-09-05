import 'package:flutter/material.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:job_app/items/StyleSettings.dart';
import 'package:job_app/pages/authorizationPage/Authorization.dart';
import 'package:job_app/pages/mainPage/tabs/RowWidget.dart';

class AddTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddTabState();
}

class _AddTabState extends State<AddTab> {
  TimeOfDay _strTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  DateTime _date = DateTime.now();
  TextEditingController _rateController = TextEditingController();
  String _user;
  double _defaultRate = 15.0;

  @override
  void initState() {
    super.initState();
    Authorization _db = Authorization();
    _db.getUser().then((currUser) {
      this._user = currUser.uid;
    });
//    _rateController.text = _defaultRate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return _createBody();
  }

  Widget _createBody() {
    return Container(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: Center(
                child: const Text("Add work", style: TextStyle(fontSize: 18))),
          ),
          Divider(
            height: 10,
            color: styleColor,
          ),
          RowWidget("Choose start time", _strTime.toString().substring(10, 15),
              AntIcons.clock_circle_outline, _showStartTimePicker),
          RowWidget("Choose end time", _endTime.toString().substring(10, 15),
              AntIcons.clock_circle_outline, _showEndTimePicker),
          RowWidget("Choose date", _date.toString().substring(5, 10),
              AntIcons.calendar_outline, _showDatePicker),
          RowWidget.textInput("Write your rate", _defaultRate.toString(),
              _rateController, 'Rate'),
          Center(
              child: IconButton(
            icon: Icon(AntIcons.save),
            iconSize: 40,
            color: styleColor,
            onPressed: () {
              _addHours();
            },
          )),
        ],
      ),
    );
  }

  Future<Null> _showDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        initialDatePickerMode: DatePickerMode.day,
        context: context,
        initialDate: _date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != _date)
      setState(() {
        _date = picked;
      });
  }

  Future<Null> _showStartTimePicker(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _strTime,
    );
    if (picked != null && picked != _strTime)
      setState(() {
        _strTime = picked;
      });
  }

  Future<Null> _showEndTimePicker(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (picked != null && picked != _endTime)
      setState(() {
        _endTime = picked;
      });
  }

  void _addHours() async {
    double workTime = (_endTime.hour + _endTime.minute / 60.0) -
        (_strTime.hour + _strTime.minute / 60.0);
    await Firestore.instance.collection(_user).add({
      'date': _date.toString().substring(5, 10),
      'strTime': _strTime.toString().substring(10, 15),
      'endTime': _endTime.toString().substring(10, 15),
      'workTime': workTime,
      'rate': _rateController.text == ""
          ? _defaultRate
          : double.parse(_rateController.text),
    });
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text('Work was added.'),
      backgroundColor: styleColor,
    ));
  }
}
