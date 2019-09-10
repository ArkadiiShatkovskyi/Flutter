import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:job_app/widgets/mainPage/MainPage.dart';
import 'package:job_app/widgets/authorizationPage/Authorization.dart';
import './AuthorizationPageBody.dart';

class SignInSignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LogInSignUpState();
}

enum FormMode { LOGIN, SIGNUP }

class _LogInSignUpState extends State<SignInSignUp> {
  FormMode _formMode;
  Authorization _db = Authorization();

  String _pageText = "Sign In";
  String _secondButtonText = "Create an account";
  bool _isLoading = false;

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_pageText),
          ),
          body: Center(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              child: _showBody(),
            ),
          ),
        ),
      ));

  @override
  void initState() {
    super.initState();
    _formMode = FormMode.LOGIN;
    _db.getUser().then((user) {
      if (user != null) {
        navigatorKey.currentState
            .push(MaterialPageRoute(builder: (context) => MainPage()));
      }
    });
  }

  void signUpWithEmail() async {
    setState(() {
      _isLoading = true;
    });
    _db
        .signUpWithEmail(
            _emailTextController.text, _passwordTextController.text)
        .then((answer) {
      if (answer == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInSignUp()));
        _formMode = FormMode.LOGIN;
      } else {
        //show message try again
      }
    });
    setState(() {
      _isLoading = false;
    });
  }

  void signInWithEmail() async {
    _db.setIsLoading();
    setState(() {
      _isLoading = _db.setToLoad();
    });
    _db
        .signInWithEmail(_emailTextController.text,
            _passwordTextController.text, navigatorKey)
        .then((answer) {
      if (answer == true) {
        navigatorKey.currentState
            .push(MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        //show message try again
        setState(() {
          _isLoading = _db.setToLoad();
        });
      }
    });
    setState(() {
      _isLoading = _db.setToLoad();
    });
  }

  Widget _showBody() {
    return AuthorizationPageBody(
        _emailTextController,
        _passwordTextController,
        _pageText,
        _secondButtonText,
        _isLoading,
        _onMainButtonPressed,
        _onSecondButtonPressed);
  }

  void _onMainButtonPressed() {
    if (_formMode == FormMode.SIGNUP) {
      setState(() {
        signUpWithEmail();
      });
    } else {
      setState(() {
        signInWithEmail();
      });
    }
  }

  void _onSecondButtonPressed() {
    if (_pageText == "Sign In") {
      setState(() {
        _formMode = FormMode.SIGNUP;
        _pageText = "Sign Up";
        _secondButtonText = "Already have an account? Sign In";
      });
    } else {
      setState(() {
        _formMode = FormMode.LOGIN;
        _pageText = "Sign In";
        _secondButtonText = "Create an account";
      });
    }
  }
}
