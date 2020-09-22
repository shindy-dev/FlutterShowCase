import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/drawer.dart';
import 'package:showcase/shindywidgets/material.dart' as Shindy;

class SlideCardsPage extends StatefulWidget {
  SlideCardsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => SlideCardsState(title);
}

class SlideCardsState extends State<SlideCardsPage> {
  SlideCardsState(this.title) : super();
  final String title;
  final typeName = (Type a) => a.toString();

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(20, (i) => "Item ${i + 1}");
    final oriItems = List<String>.generate(20, (i) => "Item ${i + 1}");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () => transitionNamed(context, '/'),
        ),
        title: Text(title),
      ),
      drawer: ShowCaseDrawer(),
      body: Builder(builder: (context) => Shindy.SlideCard(items)),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            _showSnackBar(context, 'Reset Items');
            setState(() {
              items.clear();
              items.insertAll(0, oriItems);
            });
          },
          tooltip: 'Reset Items',
          child: Icon(Icons.restore),
        ),
      ),
    );
  }
}
