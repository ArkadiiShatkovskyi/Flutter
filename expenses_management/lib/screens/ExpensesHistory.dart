import 'package:flutter/material.dart';

import '../widgets/HistoryList.dart';
import '../widgets/ChartBar.dart';

class ExpensesHistory extends StatelessWidget {
//  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses app"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
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
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(
          context: context,
          builder: (context) => Container(child: _showBottomSheet()),
        ),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: SizedBox(
                width: media.width,
                height: media.height * .4,
                child: ChartBar()),
          ),
          Positioned(
            top: media.height * .38,
            child: HistoryList(),
          ),
        ],
      ),
    );
  }

  Widget _showBottomSheet() {
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Text1"),
              Text("Text1"),
            ],
          ),
        ],
      ),
    );
  }
}
