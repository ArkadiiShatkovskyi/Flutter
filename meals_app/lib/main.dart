import 'package:flutter/material.dart';

import './screens/ReciplesList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals application',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: ReciplesList(),
    );
  }
}
