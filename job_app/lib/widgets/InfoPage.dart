import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/mainPage/MainPage.dart';
import './AppTheme.dart';

class InfoWidget extends StatelessWidget {
  final String bcgImage = null;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
              title: const Text("About"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainPage())),
              )),
          body: Container(
            child: ListView(padding: EdgeInsets.all(15.0), children: <Widget>[
              Divider(
                height: media.size.height * .04,
                color: Colors.transparent,
              ),
              Container(
                width: media.size.width * .7,
                height: media.size.width * .8,
                child: SvgPicture.asset(
                    "assets/images/undraw_mobile_prototyping_grmd.svg"),
              ),
              Divider(
                height: media.size.height * .05,
              ),
              Card(
                  elevation: 0,
                  color: Colors.transparent.withOpacity(0.0),
                  child: Container(
                    color: Colors.transparent,
                    child: Text(
                      "Hi, i'm Arkadii Shatkovskyi. Android Developer. It's my first app in flutter. I hope you enjoy it. \n Best regards A.S.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17),
                    ),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
