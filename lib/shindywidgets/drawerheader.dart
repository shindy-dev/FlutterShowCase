import 'package:flutter/material.dart';

class DrawerHeader extends StatelessWidget {
  DrawerHeader({String title, Color color, double height})
      : _title = title,
        _color = color,
        _height = height;
  final String _title;
  final Color _color;
  final double _height;

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = Theme.of(context).primaryTextTheme.headline6;
    final double _padBottom = (kToolbarHeight - _textStyle.fontSize) / 2;

    return Container(
      color: _color ?? Theme.of(context).primaryColor,
      height: _height ?? MediaQuery.of(context).padding.top + kToolbarHeight,
      padding: EdgeInsets.fromLTRB(18, 18, 18, _padBottom),
      alignment: Alignment.bottomLeft,
      child: Text(
        _title,
        style: _textStyle,
      ),
    );
  }
}
