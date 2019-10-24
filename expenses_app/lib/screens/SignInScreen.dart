import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
        child: Icon(Icons.arrow_forward, color: Colors.lightBlueAccent,),
      ),
      body: createBody(context),
    );
  }

  Widget createBody(context) {
    final media = MediaQuery.of(context);
    return Container(
      color: Colors.lightBlueAccent,
      width: media.size.width,
      height: media.size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: media.size.height * .30,
            left: media.size.width * .10,
            right: media.size.width * .10,
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
                            fontStyle: FontStyle.italic, fontSize: 30, color: Colors.lightBlueAccent),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                            borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.mail_outline,
                            size: 26,
                            color: Colors.lightBlueAccent,
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
                            borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                          ),
                          icon: Icon(
                            Icons.mail_outline,
                            color: Colors.lightBlueAccent,
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
