import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: media.size.height * .4,
              child: const Text(
                "Log in",
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      ),
    );
  }
}
