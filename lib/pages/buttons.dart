import 'package:flutter/material.dart';
import 'package:showcase/drawer.dart';

class ButtonsPage extends StatelessWidget {
  ButtonsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () => transitionNamed(context, '/'),
        ),
        title: Text(
          title,
        ),
      ),
      drawer: ShowCaseDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
