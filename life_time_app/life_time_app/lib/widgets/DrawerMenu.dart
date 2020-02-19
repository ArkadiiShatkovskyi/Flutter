import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          new Container(
            child: new DrawerHeader(
              child: Center(
                child: Container(
                  child: Text("Header here"),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: media.height * 0.01),
            child: ListTile(title: const Text("Menu"), onTap: () {}),
          ),
          Padding(
            padding: EdgeInsets.only(top: media.height * 0.01),
            child: ListTile(title: const Text("About"), onTap: () {}),
          ),
          Padding(
            padding: EdgeInsets.only(top: media.height * 0.01),
            child: ListTile(title: const Text("Contact"), onTap: () {}),
          ),
        ],
      ),
    );
  }
}
