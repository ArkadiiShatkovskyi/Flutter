import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:job_app/widgets/mainPage/drawer/DrawerCard.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:job_app/widgets/AppTheme.dart';

class MenuDrawer extends StatelessWidget {
  final String drawerFont = 'CourgetteRegular';
  final double tilesFontSize = 20;
  final double iconsSize = 20.0;
  final double titleDrawerSize = 30.0;
  final int menuItem;

  MenuDrawer(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: _getList(),
    );
  }

  Container _drawerStyle() {
    return Container(
//      decoration: BoxDecoraґtion(color: styleColor),
      height: 175.0,
      child: DrawerHeader(
        decoration: BoxDecoration(color: appTheme.primaryColor),
          child: Center(
        child: Text(
          "Menu",
          style: TextStyle(
            color: Colors.white,
            fontFamily: drawerFont,
            fontSize: titleDrawerSize,
          ),
        ),
      )),
    );
  }

  ListView _getList() {
    if (this.menuItem == 2) {
      return ListView(padding: EdgeInsets.zero, children: <Widget>[
        _drawerStyle(),
        Divider(height: 10, color: Colors.transparent),
        DrawerCard("Account", drawerFont, iconsSize, tilesFontSize,
            AntIcons.user), //not added
        DrawerCard("Settings", drawerFont, iconsSize, tilesFontSize,
            AntIcons.setting_outline), //not added
        DrawerCard("About", drawerFont, iconsSize, tilesFontSize,
            AntIcons.info_circle_outline),
        DrawerCard("Close", drawerFont, iconsSize, tilesFontSize,
            AntIcons.close_square_outline), //modify
      ]);
    } else {
      return ListView(padding: EdgeInsets.zero, children: <Widget>[
        Divider(height: 50,),
        _drawerStyle(),
        DrawerCard("Account", drawerFont, iconsSize, tilesFontSize,
            AntIcons.user), //not added
        DrawerCard("Calendar", drawerFont, iconsSize, tilesFontSize,
            AntIcons.calendar_outline),
        DrawerCard("Settings", drawerFont, iconsSize, tilesFontSize,
            AntIcons.setting_outline), //not added
        DrawerCard("About", drawerFont, iconsSize, tilesFontSize,
            AntIcons.info_circle_outline),
        DrawerCard("Close", drawerFont, iconsSize, tilesFontSize,
            AntIcons.close_square_outline), //modify
      ]);
    }
  }
}
