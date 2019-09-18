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
          Container(
            child: Image.asset(
              'assets/images/test_image.jpg',
              width: media.size.width,
              height: media.size.height * .75,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 40),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {},
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        child: Text(
                          "Fancy test photo to view",
                          style: TextStyle(
                            fontFamily: 'Chilanka-Regular',
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        width: media.size.width * .35),
                  ],
                ),
              ),
              Container(
                width: media.size.width,
                height: media.size.height * .05,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
              ),
              Container(
                width: media.size.width,
                height: media.size.height * .05,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: SmoothStarRating(
                          size: 25,
                          color: Colors.red,
                          borderColor: Colors.black,
                          rating: _ranking,
                          onRatingChanged: (v) {
                            setState(() {
                              _ranking = v;
                            });
                          },
                        )),
                  ],
                ),
              ),
              Container(
                height: media.size.height * .20,
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      width: media.size.width * .5,
                      child: Text(
                        "Awesome photo of building. Dark place of Wroclaw. By A. S",
                        style: TextStyle(
                            fontFamily: 'Chilanka-Regular',
                            fontWeight: FontWeight.w400,
                            fontSize: 21),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(right: 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 3,
                                )
                              ]),
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              size: 35,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(right: 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 3,
                                )
                              ]),
                          child: IconButton(
                            icon: Icon(
                              Icons.share,
                              size: 35,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
