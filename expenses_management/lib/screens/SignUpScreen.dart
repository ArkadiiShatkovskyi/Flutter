import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
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
              controller: phoneNumController,
              decoration: InputDecoration(labelText: "Phone Number", prefixText: "+48", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: media.height * 0.1, bottom: media.height * 0.05,),
            child: FlatButton(
              child: Text("Send code"),
              onPressed: () => verifyPhoneNumber(context),
            ),
          ), //FlatButton
        ], // Widget
      ),
    ); // Column
  }

  /// method to verify phone number and handle phone auth
  void verifyPhoneNumber(BuildContext context) async {
    String phoneNumber = "+48" + phoneNumController.text.toString();
    print("Phone: " + phoneNumber);
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (authCredential) => _verificationComplete(authCredential, context),
        verificationFailed: (authException) => _verificationFailed(authException, context),
        codeAutoRetrievalTimeout: (verificationId) => _codeAutoRetrievalTimeout(verificationId),
        // called when the SMS code is sent
        codeSent: (verificationId, [code]) => _smsCodeSent(verificationId, [code]));
  }

  /// will get an AuthCredential object that will help with logging into Firebase.
  void _verificationComplete(AuthCredential authCredential, BuildContext context) {
    FirebaseAuth.instance.signInWithCredential(authCredential).then((authResult) {
      final snackBar = SnackBar(content: Text("Success!!! UUID is: " + authResult.user.uid));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void _smsCodeSent(String verificationId, List<int> code) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }

  void _verificationFailed(AuthException authException, BuildContext context) {
    final snackBar = SnackBar(content: Text("Exception!! message:" + authException.message.toString()));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }
}