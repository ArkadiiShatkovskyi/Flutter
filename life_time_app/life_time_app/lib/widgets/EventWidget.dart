import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
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
                child: AspectRatio(
                  aspectRatio: 12 / 9,
                  child: Image.asset(
                    "assets/images/test.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
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
}
