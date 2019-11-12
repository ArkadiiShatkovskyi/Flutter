import 'package:flutter/material.dart';

import './FieldWidget.dart';

import 'package:flutter_svg/flutter_svg.dart';

class RegistrationStep extends StatelessWidget{

  final image;
  final textController1;
  final textController2;
  final icon1;
  final icon2;
  final labelText1;
  final labelText2;

  RegistrationStep({this.image, this.textController1, this.textController2, this.icon1, this.icon2, this.labelText1, this.labelText2});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              width: media.size.width * .5,
              height: media.size.height * .3,
              margin: const EdgeInsets.only(bottom: 20),
              child: SvgPicture.asset(
                  image),
            ),
            SizedBox(
              height: 30,
            ),
            FieldWidget(
                width: media.size.width,
                icon: icon1,
                textController: textController1,
                labelText: labelText1),
            SizedBox(height: 10),
            FieldWidget(
                width: media.size.width,
                icon: icon2,
                textController: textController2,
                labelText: labelText2),
          ],
        ),
      ),
    );
  }
}