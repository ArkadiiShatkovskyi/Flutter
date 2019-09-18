import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewScreenState();

}

class _ViewScreenState extends State<ViewScreen> {
  @override
  void initState(){
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
