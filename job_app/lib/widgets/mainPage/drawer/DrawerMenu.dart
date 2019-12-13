import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:ant_icons/ant_icons.dart';

import 'package:job_app/widgets/mainPage/drawer/DrawerCard.dart';

class DrawerMenu extends StatelessWidget {
  final String drawerFont = 'CourgetteRegular';
  final double tilesFontSize = 20;
  final double iconsSize = 20.0;
  final double titleDrawerSize = 30.0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Drawer(
      child: _getList(media, context),
    );
  }

  Container _drawerStyle(media, context) {
    return Container(
      height: media.size.height * .3,
      child: DrawerHeader(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Center(
          child: Text(
            "Menu",
            style: TextStyle(
              color: Colors.white,
              fontFamily: drawerFont,
              fontSize: titleDrawerSize,
            ),
          ),
        ),
      ),
    );
  }

  ListView _getList(media, context) {
    return ListView(padding: EdgeInsets.zero, children: <Widget>[
      _drawerStyle(media, context),
      Divider(height: media.size.height * .01, color: Colors.transparent),
      DrawerCard(
          text: "About",
          font: drawerFont,
          iconsSize: iconsSize,
          tilesFontSize: tilesFontSize,
          icon: AntIcons.info_circle_outline),
      DrawerCard(
          text: "Close",
          font: drawerFont,
          iconsSize: iconsSize,
          tilesFontSize: tilesFontSize,
          icon: AntIcons.close_circle_outline), //modify
    ]);
  }
}
