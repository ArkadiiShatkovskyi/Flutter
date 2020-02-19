import 'package:flutter/material.dart';

import '../widgets/DrawerMenu.dart';

class AddScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerMenu(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: media.height * 0.08,
          child: Padding(
            padding: EdgeInsets.only(
              left: media.width * 0.05,
              right: media.width * 0.05,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => scaffoldKey.currentState.openDrawer(),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text("Date"),
              Text(DateTime.now().toString()),
            ],
          ),
          Row(
            children: <Widget>[
              const Text("Title"),
              Container(
                width: media.width * .2,
                child: TextFormField(
                  initialValue: "title",
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Text("Note"),
              Container(
                width: media.width * .2,
                child: TextFormField(
                  initialValue: "Take a note",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
