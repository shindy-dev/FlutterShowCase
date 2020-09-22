import 'package:flutter/material.dart';
import 'package:showcase/drawer.dart';
import 'package:showcase/shindywidgets/material.dart' as Shindy;

class PicturePage extends StatelessWidget {
  PicturePage({Key key, this.title}) : super(key: key);
  final String title;
  final typeName = (Type a) => a.toString();

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () => transitionNamed(context, '/'),
        ),
        title: Text(title),
      ),
      drawer: ShowCaseDrawer(),
      body: Builder(
        builder: (context) => Center(
          child: Shindy.ImageViewer(image: Image.asset('images/S.png')),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () =>
              _showSnackBar(context, typeName(FloatingActionButton)),
          tooltip: typeName(FloatingActionButton),
          child: Icon(Icons.audiotrack),
        ),
      ),
    );
  }
}
