import 'package:flutter/material.dart';

import 'package:job_app/widgets/authorizationPage/Authorization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './SummaryCard.dart';

class SummaryTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  List<dynamic> _listOfWork = List();
  Authorization _authorization = Authorization();

  @override
  void initState() {
    super.initState();
    _authorization.getUser().then((currUser) {
      _getValues(currUser.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _listOfWork.length,
        itemBuilder: (BuildContext ctxt, int index) => _createItems(index));
  }

  void _getValues(String user) {
    /*** GETTING DATA FROM DATA BASE AND SETTING UP VARIABLES ***/
    FirebaseFirestore.instance.collection(user).snapshots().listen((snapshot) {
      //Map<String, dynamic> data = snapshot.docs.
      double tempWorkTime = snapshot.docs.fold(0, (tot, doc) {
        var tempData = doc.data();
        return tot + tempData["workTime"];
        //return tot + doc.data["workTime"];
      });
      double tempSalary = snapshot.docs
          .fold(0, (tot, doc) {
            var tempData = doc.data();
            return tot + tempData["workTime"] * tempData['rate'];
            //return tot + doc.data['workTime'] * doc.data['rate']});
          });
      if (mounted)
        setState(() {
          List<Map> result = [
            {'rate': 'Total', 'workTime': tempWorkTime, 'salary': tempSalary}
          ];
          result.addAll(_createListOfMonths(snapshot));
          result.addAll(_createListOfWorkPerRate(snapshot));
          this._listOfWork = result;
        });
    });
  }

  Widget _createItems(int index) {
    /*** CREATING WIDGET O SHOW DATA ***/
    return _listOfWork[index]['month'] == null
        ? SummaryCard.workPerRate(
            rate: _listOfWork[index]['rate'].toString(),
            workTime: _listOfWork[index]['workTime'],
            salary: _listOfWork[index]['salary'])
        : SummaryCard.workPerMonth(
            month: _listOfWork[index]['month'],
            workTime: _listOfWork[index]['workTime'],
            salary: _listOfWork[index]['salary'],
          );
  }

  List<Map> _createListOfMonths(QuerySnapshot snapshot) {
    List<Map> months = List();
    snapshot.docs.map((document) {
      String month = document['date'].toString().substring(0, 2);
      if (!itemIsOnTheList(months, 'month', month)) {
//      if (months.indexOf({'month': month}) == -1) {
        months.add({'month': month});
        return month;
      }
      return null;
    }).toList();
    for (int i = 0; i < months.length; i++) {
      months[i]['workTime'] = 0;
      months[i]['salary'] = 0;
      months[i] = snapshot.docs
          .where((doc) =>
              (doc['date'].toString().substring(0, 2) == months[i]['month']))
          .fold(months[i], (tot, doc) {
        tot['workTime'] = tot['workTime'] + doc['workTime'];
        tot['salary'] = tot['salary'] + (doc['workTime'] * doc['rate']);
        return tot;
      });
    }
    return months;
  }

  List<Map> _createListOfWorkPerRate(QuerySnapshot snapshot) {
    List<Map> list = List();
    snapshot.docs.map((doc) {
      if (!itemIsOnTheList(list, 'rate', doc['rate'])) {
//      if (list.indexOf({'rate': doc['rate']}) == -1) {
        list.add({'rate': doc['rate']});
        return {'rate': doc['rate']};
      }
      return null;
    }).toList();
    for (int index = 0; index < list.length; index++) {
      list[index]['workTime'] = 0;
      list[index]['salary'] = 0;
      list[index] = snapshot.docs
          .where((doc) => (doc['rate'] == list[index]['rate']))
          .fold(list[index], (tot, doc) {
        tot['workTime'] = tot['workTime'] + doc['workTime'];
        tot['salary'] = tot['salary'] + (doc['workTime'] * doc['rate']);
        return tot;
      });
    }
    return list;
  }

  bool itemIsOnTheList(List list, String itemName, var value) {
    return list.any((itemOnList) {
      return itemOnList[itemName] == value;
    });
  }
}
