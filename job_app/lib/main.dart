import 'package:flutter/material.dart';

import './widgets/authorizationPage/SignInPage.dart';
import './models/RateReader.dart';

void main() => runApp(JobApp());

class JobApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    writeCounter(17.0);
    _getRate();
//    print("Rate readed: " + result.toString());
    return SingInPage();
  }

  void _getRate() async{
    var result =  await readCounter();
    print("Rate readed: " + result.toString());
  }
}