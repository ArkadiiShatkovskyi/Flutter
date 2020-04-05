import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen>{

  TextEditingController phoneNumController;
  String _smsVerificationCode;

  @override
  void initState() {
    _smsVerificationCode = '';
    phoneNumController = TextEditingController();
    super.initState();
  }

  @override
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
              controller: phoneNumController,
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
  }
}