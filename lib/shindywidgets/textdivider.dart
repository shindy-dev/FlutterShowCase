import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  TextDivider({String title, Color color, double height, double thickness})
      : _title = title,
        _color = color,
        _height = height,
        _thickness = thickness;
  final String _title;
  final Color _color;
  final double _height;
  final double _thickness;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_title ?? ''),
        Divider(
          height: _height ?? 1,
          thickness: _thickness ?? 1,
          color: _color ?? DividerTheme.of(context).color,
        ),
      ],
    );
  }
}
