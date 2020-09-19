import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material show PopupMenuButton;

class PopupMenuButton<T> extends StatefulWidget {
  PopupMenuButton(List<T> items, {T selected, void Function(T) onSelected})
      : _items = items,
        _selected = selected ?? (items.length > 0) ? items[0] : null,
        _onSelected = onSelected;
  final List<T> _items;
  final T _selected;
  final void Function(T) _onSelected;
  T get selected => _selected;
  State createState() => _PopupMenuButtonState(_items, _selected, _onSelected);
}

class _PopupMenuButtonState<T> extends State<PopupMenuButton> {
  _PopupMenuButtonState(List<T> items, T selected, void Function(T) onSelected)
      : _items = items,
        _selected = selected,
        _onSelected = onSelected;
  final List<T> _items;
  T _selected;
  final void Function(T) _onSelected;

  @override
  Widget build(BuildContext context) => material.PopupMenuButton<T>(
        itemBuilder: (BuildContext context) => _items
            .map((T s) => PopupMenuItem<T>(
                  child: Text(s?.toString()),
                  value: s,
                ))
            .toList(),
        onSelected: (value) {
          _onSelected?.call(value);
          setState(() => _selected = value);
        },
      );
}
