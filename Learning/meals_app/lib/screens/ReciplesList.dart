import 'package:flutter/material.dart';

import '../widgets/RecipeWidget.dart';

class ReciplesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReciplesListState();
}

class _ReciplesListState extends State<ReciplesList> {

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: media.height * 0.08,
          child: Padding(
            padding: EdgeInsets.only(
              left: media.width * 0.05,
              right: media.width * 0.05,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GridView.count(
        crossAxisCount: 1,
        // mainAxisSpacing: 10,
        // crossAxisSpacing: 10,
        padding: const EdgeInsets.only(top:35),
        children: <Widget>[
          RecipeWidget(media),
          RecipeWidget(media),
          RecipeWidget(media),
          RecipeWidget(media),
          RecipeWidget(media),
          RecipeWidget(media),
          RecipeWidget(media),
          RecipeWidget(media),
          RecipeWidget(media),
          RecipeWidget(media),
          RecipeWidget(media),
          RecipeWidget(media),
        ],
      ),
    );
  }
}
