import 'package:flutter/material.dart';

import './widgets/authorizationPage/SignInSignUpPage.dart';

void main() => runApp(JobApp());

class JobApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SignInSignUp();
  }
}
