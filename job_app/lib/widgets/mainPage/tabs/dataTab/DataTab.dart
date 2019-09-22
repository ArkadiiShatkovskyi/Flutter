import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:job_app/widgets/authorizationPage/Authorization.dart';
import 'package:job_app/widgets/mainPage/tabs/dataTab/FloatingButtonMenu.dart';
import '../../../../models/Record.dart';
import './EditRecordWidget.dart';

class DataTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> {
  String _user = "1";
  Authorization _db = Authorization();
  List<String> _selectedItems;
  List<Record> _listOfRecors;
  Record _itemToEdit;

  @override
  void initState() {
    super.initState();
    _selectedItems = List();
    _listOfRecors = List();
    _itemToEdit = null;
    _getUser();
  }

  void _getUser() async {
    var firebaseUser = await _db.getUser();
    setState(() {
      _user = firebaseUser.uid;
      _getData(_user);
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _listOfRecors.length == 0
              ? Center(
                  child: Container(
                      padding: EdgeInsets.only(top: media.size.height * .4),
                      child: CircularProgressIndicator()))
              : DataTable(
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
                  rows: _createRowsList()),
        ],
      ),
      floatingActionButton: FloatingButtonMenu(
          _deleteSelectedItems, () => _editItem(context, media)),
    );
  }

  void _getData(user) async {
    /// GET DATA FROM DATABASE TO ROWS
    Firestore.instance.collection(_user).snapshots().listen((snapshot) {
      List<Record> list =
          snapshot.documents.map((DocumentSnapshot documentSnapshot) {
        return Record(
          id: documentSnapshot.documentID,
          date: documentSnapshot['date'].toString(),
          startTime: documentSnapshot['strTime'].toString(),
          endTime: documentSnapshot['endTime'].toString(),
          workTime: documentSnapshot['workTime'],
          rate: documentSnapshot['rate'],
        );
      }).toList();
      setState(() {
        _listOfRecors = list;
      });
    });
  }

  List<DataRow> _createRowsList() {
    return _listOfRecors.map((rec) {
      return DataRow(
        selected: _selectedItems.indexOf(rec.id) != -1,
        onSelectChanged: (bool selected) {
          if (selected) {
            setState(() {
              _itemToEdit = rec;
              _selectedItems.add(rec.id);
            });
          } else {
            setState(() {
              _itemToEdit = null;
              _selectedItems.remove(rec.id);
            });
          }
        },
        cells: [
          DataCell(Center(child: Text(rec.date))),
          DataCell(Center(child: Text(rec.startTime))),
          DataCell(Center(child: Text(rec.endTime))),
          DataCell(Center(
              child: Text(rec.workTime.toString().length > 4
                  ? rec.workTime.toString().substring(0, 4)
                  : rec.workTime.toString()))),
          DataCell(
            Center(child: Text(rec.rate.toString())),
          )
        ],
      );
    }).toList();
  }

  void _deleteSelectedItems() {
    if (_selectedItems.length > 0) {
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
        _getData(_user);
      });
      _showShackBarMessage('Items was deleted');
    } else
      _showShackBarMessage('Choose items to delete');
  }

  void _editItem(BuildContext context, MediaQueryData media) {
    if (_selectedItems.length == 1)
      showBottomSheet(
        context: context,
        builder: (context) => EditRecordWidget(
          editItem: _itemToEdit,
          user: _user,
        ),
      );
    else
      _showShackBarMessage("Choose one item");
  }

  void _showShackBarMessage(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(message),
      backgroundColor: Theme.of(context).primaryColor,
    ));
  }
}
