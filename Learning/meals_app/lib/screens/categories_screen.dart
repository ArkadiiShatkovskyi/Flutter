import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  void selectCategory(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return CategoryMealsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((e) => InkWell(
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
              onTap: () => selectCategory(context),
              child: CategoryItem(
                    title: e.title,
                    color: e.color,
                  ),
            ))
            .toList(),
      ),
    );
  }
}
