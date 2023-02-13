import 'package:flutter/material.dart';

import 'map_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Draw polygon app'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: SizedBox(
        height: mediaQuery.height * 0.06,
        width: mediaQuery.width * 0.3,
        child: FloatingActionButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GoogleMapScreen(),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Open map',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.map,
                  color: Colors.white,
                ),
              ],
            ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Testing Google Maps',
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              Padding(
                padding: EdgeInsets.all(mediaQuery.height * 0.02),
              ),
              SizedBox(
                height: mediaQuery.height * 0.1,
              ),
              Text(
                'Click on the button to see a map',
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.bodyText2,
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
