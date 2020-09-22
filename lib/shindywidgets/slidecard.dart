import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

typedef SlideCardDismissEvent = Function(BuildContext, DismissDirection, int);

class SlideCard extends StatefulWidget {
  SlideCard(this.items, {this.onDismissed});
  final List items;
  final SlideCardDismissEvent onDismissed;
  @override
  State<StatefulWidget> createState() => SlideCardState(items, onDismissed);
}

class SlideCardState extends State<SlideCard> {
  SlideCardState(this.items, this.onDismissed);
  final List items;
  final SlideCardDismissEvent onDismissed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          key: Key(item),
          onDismissed: (direction) {
            setState(() => items.removeAt(index));
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text("$item dismissed")));
            onDismissed?.call(context, direction, index);
          },
          background: Container(color: Colors.red),
          child: ListTile(title: Text('$item')),
        );
      },
    );
  }
}
