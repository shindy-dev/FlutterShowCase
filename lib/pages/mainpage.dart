import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/drawer.dart';
import 'package:showcase/notifiers/countnotifier.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;
  static final countManager = StateNotifierProvider((ref) => CountNotifier(0));

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: ShowCaseDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, watch, widget) => Text(
                watch(countManager.state).toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RaisedButton(
              child: Text('Reset'),
              color: Theme.of(context).primaryColor,
              onPressed: context.read(countManager).reset,
            ),
            RaisedButton(
              child: Text('Open Drawer'),
              color: Theme.of(context).primaryColor,
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read(countManager).increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
