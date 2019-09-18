import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

class ViewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  double _ranking;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    _ranking = 3;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 40),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                width: media.size.width * .7,
                child: Text(
                  "Photos application",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 50,
//              left: 10,
//              right: 10,
            ),
            child: Image.asset(
              'assets/images/test_image.jpg',
              width: media.size.width,
              height: media.size.height * .75,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: media.size.width * .35,
                    child: Text(
                      "Awesome photo of building. By Arek",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 30, right: 15),
                      child: SmoothStarRating(
                        size: 30,
                        color: Colors.red,
                        borderColor: Colors.black,
                        rating: _ranking,
                        onRatingChanged: (v) {
                          setState(() {
                            _ranking = v;
                          });
                        },
                      ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
