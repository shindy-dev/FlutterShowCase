import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show DropdownButton;

class DropdownButton<T> extends StatefulWidget {
  DropdownButton(List<T> items, {T selected, void Function(dynamic) onChenged})
      : _items = items,
        _selected = selected ?? (items.length > 0) ? items[0] : null,
        _onChanged = onChenged;
  final List<T> _items;
  final T _selected;
  final void Function(dynamic) _onChanged;
  T get selected => _selected;
  State createState() => _DropdownButtonState(_items, _selected, _onChanged);
}

class _DropdownButtonState<T> extends State<DropdownButton> {
  _DropdownButtonState(
      List<T> items, T selected, void Function(dynamic) onChanged)
      : _items = items,
        _selected = selected,
        _onChanged = onChanged;
  final List<dynamic> _items;
  T _selected;
  final void Function(dynamic) _onChanged;

  @override
  Widget build(BuildContext context) => DropdownButtonHideUnderline(
        child: material.DropdownButton<T>(
          isExpanded: true,
          value: _selected,
          onChanged: (T value) {
            _onChanged?.call(value);
            setState(() => _selected = value);
          },
          items: _items
              .map((item) => DropdownMenuItem<T>(
                    value: item,
                    child: Text(item?.toString()),
                  ))
              .toList(),
        ),
      );
}
