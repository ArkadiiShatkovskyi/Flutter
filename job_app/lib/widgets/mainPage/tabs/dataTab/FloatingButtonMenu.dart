import 'package:flutter/material.dart';

import "package:ant_icons/ant_icons.dart";

import 'package:job_app/widgets/AppTheme.dart';

// ignore: must_be_immutable
class FloatingButtonMenu extends StatefulWidget {
  Function _deleteFunction;
  Function _editFunction;

  FloatingButtonMenu(this._deleteFunction, this._editFunction);

  @override
  _FloatingButtonMenuState createState() => _FloatingButtonMenuState();
}

class _FloatingButtonMenuState extends State<FloatingButtonMenu>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  _FloatingButtonMenuState();

  @override
  void initState() {
    _animationController =
        AnimationController(value: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: appTheme.primaryColor,
      end: Colors.redAccent,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget _add() {
    return Container(
      child: FloatingActionButton(
        heroTag: 2,
        onPressed: widget._deleteFunction,
        tooltip: 'Delete',
        child: const Icon(Icons.delete_outline),
      ),
    );
  }

  Widget _edit() {
    return Container(
      child: FloatingActionButton(
        heroTag: 1,
        onPressed: widget._editFunction,
        tooltip: 'Inbox',
        child: const Icon(AntIcons.edit_outline),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: 0,
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: _add(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: _edit(),
        ),
        toggle(),
      ],
    );
  }
}
