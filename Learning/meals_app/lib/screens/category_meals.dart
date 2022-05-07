import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  //
  // const CategoryMealsScreen({Key key, this.categoryId, this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
      body: Center(
        child: Container(
          child: Text(categoryTitle),
        ),
      ),
    );
  }
}
