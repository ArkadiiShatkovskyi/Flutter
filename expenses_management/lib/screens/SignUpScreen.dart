import '../models/Expense.dart';
import '../models/ExpenseBloc.dart';

import 'package:flutter/material.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:path_provider/path_provider.dart';

class SignUpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen>{

  TextEditingController textController;
  final bloc = ExpenseBloc();

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  Widget test(){
/* 
    getApplicationDocumentsDirectory().then((value){
      print("HERE");
      print("value: $value");
    }); */

    return Scaffold(
      body: StreamBuilder<List<dynamic>>(
        stream: bloc.expenses,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            // print("ITEMS: ${snapshot.data.length.toString()}");
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Expense item = snapshot.data[index];
                return ListTile(
                  title: Text(item.title),
                  leading: Text(item.id.toString()),
                );
              },
            );
          } else {
            return Center(child: Text("Not found !", style: TextStyle(color: Colors.black),));
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return test();
  }

  /* @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: media.height * 0.1, bottom: media.height * 0.05,),
              width: media.width * .5,
              height: media.height * .45,
              child: SvgPicture.asset("assets/images/undraw_step_to_the_sun_nxqq.svg"),
          ),
          Padding(
            padding: EdgeInsets.only(top: media.height * 0.05, bottom: media.height * 0.05, left: media.width * 0.12, right: media.width * 0.12,),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: textController,
              decoration: InputDecoration(labelText: "Phone Number", prefixText: "+48", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: media.height * 0.1, bottom: media.height * 0.05,),
            child: FlatButton(
//              shape: ShapeBorder,
              child: Text("Send code"),
              onPressed: () => {},
            ),
          ), //FlatButton
        ], // Widget
      ),
    ); // Column
  } */
}