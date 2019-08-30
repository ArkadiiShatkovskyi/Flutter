import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_app/pages/authorizationPage/Authorization.dart';
import 'package:job_app/items/StyleSettings.dart';

class HomeTab extends StatefulWidget {

  var _state = new _HomeTabState();

  Function getDeleteFunction(){
    return _state.deleteSelectedItems;
  }

  @override
  State<StatefulWidget> createState() => _state;
}

class _HomeTabState extends State<HomeTab> {
  String _user = "1";
  Authorization _db = Authorization();
  List<String> _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = List();
    _getUser();
  }

  void _getUser() async {
    var firebaseUser = await _db.getUser();
    setState(() {
      _user = firebaseUser.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection(_user).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(styleColor)));
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
                columnSpacing: 5,
                columns: [
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
                ],
                rows: _createRows(snapshot.data)),
          );
        });
  }

  List<DataRow> _createRows(QuerySnapshot snapshot) {
    List<DataRow> newList =
        snapshot.documents.map((DocumentSnapshot documentSnapshot) {
      return DataRow(
          selected: _selectedItem.indexOf(documentSnapshot.documentID) != -1,
          onSelectChanged: (bool selected) {
            if (selected) {
              setState(() {
                _selectedItem.add(documentSnapshot.documentID);
              });
            } else {
              setState(() {
                _selectedItem.remove(documentSnapshot.documentID);
              });
            }
          },
          cells: [
            DataCell(Center(child: Text(documentSnapshot['date'].toString()))),
            DataCell(
                Center(child: Text(documentSnapshot['strTime'].toString()))),
            DataCell(
                Center(child: Text(documentSnapshot['endTime'].toString()))),
            DataCell(Center(
                child: Text(documentSnapshot['workTime'].toString().length > 4
                    ? documentSnapshot['workTime'].toString().substring(0, 4)
                    : documentSnapshot['workTime'].toString()))),
            DataCell(
              Center(child: Text(documentSnapshot['rate'].toString())),
            ),
          ]);
    }).toList();
    return newList;
  }

  void deleteSelectedItems() {
    if (_selectedItem.length > 0)
      for (int index = 0; index < _selectedItem.length; index++) {
        Firestore.instance
            .collection('testcrud')
            .document(_selectedItem[index])
            .delete()
            .catchError((e) {
          print(e);
        });
        _showShackBarMessage('Item was deleted');
      }
    else _showShackBarMessage('Choose items to delete');
  }

  void _showShackBarMessage(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: styleColor,
    ));
  }
}