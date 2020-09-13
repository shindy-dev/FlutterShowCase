import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem({String title, Widget child})
      : _title = title,
        _child = child;
  final String _title;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(_title), _child],
    );
  }
}
