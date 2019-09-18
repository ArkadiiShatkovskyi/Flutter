import 'package:flutter/material.dart';

import 'package:ant_icons/ant_icons.dart';

import 'package:job_app/widgets/AppTheme.dart';

class AuthorizationPageBody extends StatelessWidget {
  final _emailTextController;
  final _passwordTextController;
  final _pageText;
  final _secondButtonText;
  final _isLoading;
  final _funMainButton;
  final _funSecondButton;

  AuthorizationPageBody(
      this._emailTextController,
      this._passwordTextController,
      this._pageText,
      this._secondButtonText,
      this._isLoading,
      this._funMainButton,
      this._funSecondButton);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          width: 250,
          height: 250,
          margin: EdgeInsets.only(bottom: 20),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 48.0,
            child: Image.asset("assets/images/undraw_mobile_login_ikmv.png"),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 40.0, right: 40.0),
          child: TextFormField(
            maxLines: 1,
            maxLength: 30,
            obscureText: false,
            decoration: InputDecoration(
              icon: Icon(
                AntIcons.mail_outline,
                color: appTheme.primaryColor,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'Email',
            ),
            controller: _emailTextController,
          ),
        ),
        Divider(
          color: Colors.transparent,
          height: 5.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 40.0, right: 40.0),
          child: TextFormField(
            maxLines: 1,
            maxLength: 20,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                AntIcons.lock_outline,
                color: appTheme.primaryColor,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: 'Password',
            ),
            controller: _passwordTextController,
          ),
        ),
        Divider(
          color: Colors.transparent,
          height: 10.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 75, right: 75),
          child: RaisedButton(
            textColor: Colors.white,
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: _funMainButton,
            child: Text(
              _pageText,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        FlatButton(
          child: Text(_secondButtonText,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300)),
          onPressed: _funSecondButton,
        ),
        _showCircularProgress(),
      ],
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
}
