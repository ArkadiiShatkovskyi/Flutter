import 'package:flutter/material.dart';
import 'package:job_app/pages/authorizationPage/Authorization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_app/items/StyleSettings.dart';

class SummaryTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  List<dynamic> _listOfRates = List();
  List<dynamic> _listOfWorkTimePerRate = List();
  List<dynamic> _listOfSalaryPerRate = List();
  Authorization _authorization = Authorization();

  @override
  void initState() {
    super.initState();
    _authorization.getUser().then((currUser) {
      _getValues(currUser.uid);
    });
  }

  void _getValues(String user) {
    Firestore.instance.collection(user).snapshots().listen((snapshot) {
      double tempWorkTime = snapshot.documents.fold(0, (tot, doc) {
        return tot + doc.data['workTime'];
      });
      double tempSalary = snapshot.documents
          .fold(0, (tot, doc) => tot + doc.data['workTime'] * doc.data['rate']);
      _listOfRates = _createListOfRates(snapshot);
      _listOfSalaryPerRate = _createListOfSalary(snapshot, _listOfRates);
      _listOfWorkTimePerRate = _createListOfWorkTime(snapshot, _listOfRates);
      if (this.mounted) {
        setState(() {
          _listOfRates.add("Total");
          _listOfWorkTimePerRate.add(tempWorkTime);
          _listOfSalaryPerRate.add(tempSalary);
//                _workedTime = tempWorkTime;
//                _salary = tempSalary;
        });
      }
    });
  }

  Widget _createItem(int index) {
    String rate = _listOfRates[index].toString();
    return Card(
//      color: Colors.white.withAlpha(230),
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        padding: EdgeInsets.only(left: 75, right: 75),
        child: Column(
          children: <Widget>[
            Divider(
              height: 30,
              color: Colors.transparent,
            ),
            Center(
                child: Text(
              rate.toString() == "Total" ? "Total" : "Job per rate: $rate",
              style: TextStyle(fontSize: 18),
            )),
            Divider(
              height: 30,
              color: styleColor,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: const Text(
                            "Time worked: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          width: 170,
                        ),
                        Text(
                          _listOfWorkTimePerRate[index].toStringAsFixed(2),
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10,
              color: Colors.transparent,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: const Text(
                      "Salary: ",
                      style: TextStyle(fontSize: 16),
                    ),
                    width: 170,
                  ),
                  Text(
                    _listOfSalaryPerRate[index].toStringAsFixed(2),
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Divider(
              height: 30,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
//                    physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _listOfRates.length,
        itemBuilder: (BuildContext ctxt, int index) => _createItem(index));
  }

  List<dynamic> _getListOfRates(QuerySnapshot snapshot) {
    List<double> tempList = List();
    return snapshot.documents.map((doc) {
      if (tempList.indexOf(doc['rate']) == -1) {
        tempList.add(doc['rate'].toDouble());
        return doc['rate'].toDouble();
      }
    }).toList();
  }

  dynamic _getListOfSalary(QuerySnapshot snapshot, double rate) {
    return snapshot.documents.map((doc) {
      if (rate == doc['rate']) return doc['rate'] * doc['workTime'];
    }).toList();
  }

  dynamic _getListOfWorkTime(QuerySnapshot snapshot, double rate) {
    return snapshot.documents.map((doc) {
      if (rate == doc['rate']) return doc['workTime'];
    }).toList();
  }

  List<dynamic> _createListOfRates(QuerySnapshot snapshot) {
    List<dynamic> temp = _getListOfRates(snapshot);
    temp.removeWhere((value) {
      return value == null;
    });
    return temp;
  }

  List<dynamic> _createListOfSalary(QuerySnapshot snapshot, List listOfRates) {
    List result = List();
    for (int i = 0; i < listOfRates.length; i++) {
      List<dynamic> temp = _getListOfSalary(snapshot, listOfRates[i]);
      temp.removeWhere((value) {
        return value == null;
      });
      result.add(temp.fold(0, (tot, doc) => tot + doc));
    }
    return result;
  }

  List<dynamic> _createListOfWorkTime(
      QuerySnapshot snapshot, List listOfRates) {
    List result = List();
    for (int i = 0; i < listOfRates.length; i++) {
      List<dynamic> temp = _getListOfWorkTime(snapshot, listOfRates[i]);
      temp.removeWhere((value) {
        return value == null;
      });
      result.add(temp.fold(0, (tot, doc) => tot + doc));
    }
    return result;
  }
}
