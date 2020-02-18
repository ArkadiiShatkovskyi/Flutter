import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {

  final nrImage;

  EventWidget(this.nrImage);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            child: Container(
              width: media.width / 2,
              child: ClipRRect(
//                borderRadius: BorderRadius.circular(30),
                child: chooseImage(),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            child: const Text(
              "Test Post",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget chooseImage(){
    String img = "assets/images/test.jpg";
    if(nrImage == 1){
      img = "assets/images/cat.jpeg";
    }else if(nrImage == 2){
      img = "assets/images/dog.jpg";
    }else if(nrImage == 3){
      img = "assets/images/raccoon.jpg";
    }
    return AspectRatio(
      aspectRatio: 12 / 9,
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
