import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  static const Color _primaryColor = Colors.indigo;

  TextEditingController _loginTextController = new TextEditingController();
  TextEditingController _passwordTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        splashColor: Colors.amberAccent,
        onPressed: (){},
        child: Icon(Icons.arrow_forward, color: _primaryColor,),
      ),
      body: createBody(context),
    );
  }

  Widget createBody(context) {
    final media = MediaQuery.of(context);
    return Container(
      color: _primaryColor,
      width: media.size.width,
      height: media.size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: media.size.height * .28,
            left: media.size.width * .1,
            right: media.size.width * .1,
            bottom: media.size.height * .28,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Container(
                margin: EdgeInsets.all(50),
                child: Column(
                  children: <Widget>[
                    const Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 30, color: _primaryColor,),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: media.size.width * .6,
                      height: 70,
                      child: TextField(
                        controller: _loginTextController,
                        maxLength: 20,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: _primaryColor, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.mail_outline,
                            size: 26,
                            color: _primaryColor,
                          ),
                          labelText: 'Log in',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: media.size.width * .6,
                      height: 70,
                      child: TextField(
                        controller: _passwordTextController,
                        maxLength: 30,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: _primaryColor, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.mail_outline,
                            color: _primaryColor,
                            size: 26,
                          ),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
