import 'package:flutter/material.dart';

import '../widgets/ExpensesList.dart';
import '../widgets/CategoriesWidget.dart';

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final media = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.white,
          elevation: 10,
          backgroundColor: Colors.indigoAccent,
          child: Icon(Icons.add,),
          onPressed: (){},
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(children: <Widget>[
            const Center(
                child: Text(
              "Expenses",
              style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
            )),
//              CategoriesWidget(),
              ExpensesList(),
          ]),
        ),
      ),
    );
  }
}
