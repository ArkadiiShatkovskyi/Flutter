import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  final size;

  RecipeWidget(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.2,
      padding: EdgeInsets.only(left:10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30),),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: size.width * 0.4, //0.8
            height: size.height * 0.2,//0.3
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
                ),
                child: recipeImage()),
          ),
          Text("Test meal"),
        ],
      ),
    );
  }
}

Widget recipeImage() {
  return AspectRatio(
    aspectRatio: 16.0 / 9.0,
    child: Image.asset(
      'assets/images/rice.jpg',
      fit: BoxFit.cover,
    ),
  );
}
