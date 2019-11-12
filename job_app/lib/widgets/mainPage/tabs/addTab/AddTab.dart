import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:job_app/widgets/authorizationPage/Authorization.dart';
import './RowWidget.dart';

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
  double _defaultRate = 17.35;

  @override
  void initState() {
    super.initState();
    Authorization _db = Authorization();
    _db.getUser().then((currUser) {
      this._user = currUser.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Container(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: media.size.height * .03,
              bottom: media.size.height * .02,
            ),
            child: const Center(
                child: const Text("Add work", style: TextStyle(fontSize: 18))),
          ),
          Divider(
            height: media.size.height * .02,
          ),
          RowWidget("Choose start time", _strTime.toString().substring(10, 15),
              AntIcons.clock_circle_outline, _showStartTimePicker, media),
          RowWidget("Choose end time", _endTime.toString().substring(10, 15),
              AntIcons.clock_circle_outline, _showEndTimePicker, media),
          RowWidget("Choose date", _date.toString().substring(5, 10),
              AntIcons.calendar_outline, _showDatePicker, media),
          RowWidget.textInput("Write your rate", _defaultRate.toString(),
              _rateController, 'Rate', media),
          Center(
              child: IconButton(
            icon: const Icon(AntIcons.save),
            iconSize: 40,
            onPressed: () {
              _addHours();
            },
          )),
        ],
      ),
    );
  }

  Future<Null> _showDatePicker(BuildContext context) async {
    final height = MediaQuery.of(context).size.height;
    showBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return SizedBox(
            height: height * .3,
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  height: height * .20,
                  child: CupertinoDatePicker(
//                    backgroundColor: Theme.of(context).pr,
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: _date,
                    minimumDate: DateTime(2015, 8),
                    maximumDate: DateTime(2050),
                    onDateTimeChanged: (DateTime dateTime) {
                      setState(() {
                        _date = dateTime;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<Null> _showStartTimePicker(BuildContext context) async {
    final height = MediaQuery.of(context).size.height;
    showBottomSheet(context: context, builder: (BuildContext ctx){
      return SizedBox(
        height: height * .3,
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(
              height: height * .20,
              child: CupertinoDatePicker(
                use24hFormat: true,
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime dateTime) {
                  setState(() {
                    _strTime = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
                  });
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Future<Null> _showEndTimePicker(BuildContext context) async {
    final height = MediaQuery.of(context).size.height;
    showBottomSheet(context: context, builder: (BuildContext ctx){
      return SizedBox(
        height: height * .3,
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(
              height: height * .20,
              child: CupertinoDatePicker(
                use24hFormat: true,
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime dateTime) {
                  setState(() {
                    _endTime = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
                  });
                },
              ),
            ),
          ],
        ),
      );
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
      duration: const Duration(seconds: 1),
      content: const Text('Work was added.'),
      backgroundColor: Theme.of(context).primaryColor,
    ));
  }
}
