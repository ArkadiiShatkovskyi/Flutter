import 'package:flutter/material.dart';

import './FieldWidget.dart';

import 'package:flutter_svg/flutter_svg.dart';

class RegistrationStep extends StatelessWidget {
  final image;
  final textController1;
  final textController2;
  final textController3;
  final icon1;
  final icon2;
  final labelText1;
  final labelText2;

  // ignore: avoid_init_to_null
  RegistrationStep(
      {this.image,
      this.textController1,
      this.textController2,
      this.icon1,
      this.icon2,
      this.labelText1,
      this.labelText2,
      this.textController3 = null});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Container(
              width: media.size.width * .5,
              height: media.size.height * .3,
              margin: const EdgeInsets.only(bottom: 20),
              child: SvgPicture.asset(image),
            ),
            SizedBox(
              height: 15,
            ),
            _passwordRepeat(media, context),
          ],
        ),
      ),
    );
  }

  Widget _passwordRepeat(media, context) {
    return textController3 == null
        ? nameSurnameStep(media)
        : emailPasswordStep(media, context);
  }

  Widget nameSurnameStep(media){
    return Container(
        height: media.size.height * .4,
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            FieldWidget(
                width: media.size.width,
                icon: icon1,
                textController: textController1,
                labelText: labelText1),
            SizedBox(height: 15),
            FieldWidget(
                width: media.size.width,
                icon: icon2,
                textController: textController2,
                labelText: labelText2)
          ],
        ),);
  }

  Widget emailPasswordStep(media, context){
    return Container(
      height: media.size.height * .4,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          FieldWidget(
              width: media.size.width,
              icon: icon1,
              textController: textController1,
              labelText: labelText1),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(
                left: media.size.width * .1, right: media.size.width * .1),
            child: TextFormField(
              controller: textController2,
              obscureText: true,
              maxLength: 30,
              decoration: InputDecoration(
                icon: Icon(
                  icon2,
                  color: Theme.of(context).primaryColor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)),
                labelText: labelText2,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(
                left: media.size.width * .1, right: media.size.width * .1),
            child: TextFormField(
              controller: textController3,
              obscureText: true,
              maxLength: 30,
              decoration: InputDecoration(
                icon: Icon(
                  icon2,
                  color: Theme.of(context).primaryColor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)),
                labelText: "Repeat password",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
