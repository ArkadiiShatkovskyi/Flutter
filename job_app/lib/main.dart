import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/authorizationPage/SignInPage.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
 SystemChrome.setPreferredOrientations([
   DeviceOrientation.portraitUp,
   DeviceOrientation.portraitDown,
 ]);
 runApp(JobApp());
}

class JobApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingInPage();
  }
}