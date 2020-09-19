import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show ToggleButtons;

class ToggleButtons extends StatefulWidget {
  ToggleButtons(List<Icon> icons, List<bool> selectedList,
      {void Function(int) onPressed})
      : _icons = icons,
        _selectedList = selectedList,
        _onPressed = onPressed;
  final List<Icon> _icons;
  final List<bool> _selectedList;
  final void Function(int) _onPressed;
  List<bool> get selectedList => _selectedList;
  State createState() => _ToggleButtonsState(_icons, _selectedList, _onPressed);
}

class _ToggleButtonsState extends State<ToggleButtons> {
  _ToggleButtonsState(
      List<Icon> icons, List<bool> selectedList, void Function(int) onPressed)
      : _icons = icons,
        _selectedList = selectedList,
        _onPressed = onPressed;
  final List<Icon> _icons;
  final List<bool> _selectedList;
  final void Function(int) _onPressed;

  @override
  Widget build(BuildContext context) => material.ToggleButtons(
        isSelected: _selectedList,
        children: _icons,
        onPressed: (index) {
          _onPressed?.call(index);
          setState(() => _selectedList[index] = !_selectedList[index]);
        },
      );
}
