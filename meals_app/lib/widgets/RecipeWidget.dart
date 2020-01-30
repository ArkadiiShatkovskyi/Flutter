import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {

  final size;

  RecipeWidget(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.45,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
          child: recipeImage()),
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
