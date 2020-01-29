import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/rice.jpg'),
        ],
      ),
    );
  }
}
