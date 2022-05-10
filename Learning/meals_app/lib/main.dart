import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

import './screens/ReciplesList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals application',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: ReciplesList(),
      //home: CategoriesScreen(),
      initialRoute: CategoriesScreen.routeName,
      routes: {
        CategoriesScreen.routeName : (context) => CategoriesScreen(),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(),
      },
    );
  }
}
