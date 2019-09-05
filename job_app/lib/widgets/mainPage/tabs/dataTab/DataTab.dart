import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_app/widgets/authorizationPage/Authorization.dart';
import 'package:job_app/items/StyleSettings.dart';
import 'package:job_app/widgets/mainPage/tabs/dataTab/FloatingButtonMenu.dart';

// ignore: must_be_immutable
class DataTab extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> {
  String _user = "1";
  Authorization _db = Authorization();
  List<String> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List();
    _getUser();
  }

  void _getUser() async {
    var firebaseUser = await _db.getUser();
    setState(() {
      _user = firebaseUser.uid;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection(_user).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(styleColor)));
            return ListView( /** CHANGE TO LIST!!!!!!!! **/
              scrollDirection: Axis.vertical,
              children:<Widget>[ DataTable(
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
                  rows: _createRows(snapshot.data))],
            );
          }),
      floatingActionButton: FloatingButtonMenu(_deleteSelectedItems),
    );
  }

  List<DataRow> _createRows(QuerySnapshot snapshot) {
    List<DataRow> newList =
        snapshot.documents.map((DocumentSnapshot documentSnapshot) {
      return DataRow(
          selected: _selectedItems.indexOf(documentSnapshot.documentID) != -1,
          onSelectChanged: (bool selected) {
            if (selected) {
              setState(() {
                _selectedItems.add(documentSnapshot.documentID);
              });
            } else {
              setState(() {
                _selectedItems.remove(documentSnapshot.documentID);
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

  void _deleteSelectedItems() {
    if (_selectedItems.length > 0){
      for (int index = 0; index < _selectedItems.length; index++) {
        Firestore.instance
            .collection(_user)
            .document(_selectedItems[index])
            .delete()
            .catchError((e) {
          print(e);
        });
      }
      setState(() {
        _selectedItems.clear();
      });
      _showShackBarMessage('Items was deleted');
    } else _showShackBarMessage('Choose items to delete');
  }

  void _showShackBarMessage(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text(message),
      backgroundColor: styleColor,
    ));
  }
}
