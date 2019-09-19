import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:ant_icons/ant_icons.dart';

import 'package:job_app/widgets/mainPage/drawer/DrawerCard.dart';
import 'package:job_app/widgets/AppTheme.dart';

class MenuDrawer extends StatelessWidget {
  final String drawerFont = 'CourgetteRegular';
  final double tilesFontSize = 20;
  final double iconsSize = 20.0;
  final double titleDrawerSize = 30.0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Drawer(
      child: _getList(media),
    );
  }

  Container _drawerStyle(media) {
    return Container(
      height: media.size.height * .25,
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

  ListView _getList(media) {
    return ListView(padding: EdgeInsets.zero, children: <Widget>[
      _drawerStyle(media),
      Divider(height: media.size.height * .01, color: Colors.transparent),
      DrawerCard(
          text: "Account",
          font: drawerFont,
          iconsSize: iconsSize,
          tilesFontSize: tilesFontSize,
          icon: AntIcons.user), //not added
      DrawerCard(
          text: "Settings",
          font: drawerFont,
          iconsSize: iconsSize,
          tilesFontSize: tilesFontSize,
          icon: AntIcons.setting_outline), //not added
      DrawerCard(
          text: "About",
          font: drawerFont,
          iconsSize: iconsSize,
          tilesFontSize: tilesFontSize,
          icon: AntIcons.info_circle_outline),
      Divider(height: media.size.height * .37, color: Colors.transparent),
      DrawerCard(
          text: "Close",
          font: drawerFont,
          iconsSize: iconsSize,
          tilesFontSize: tilesFontSize,
          icon: AntIcons.close_circle_outline), //modify
    ]);
  }
}
