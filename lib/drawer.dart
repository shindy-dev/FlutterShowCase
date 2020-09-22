import 'package:flutter/material.dart';
import 'package:showcase/shindywidgets/material.dart' as Shindy;

void _transitionNamed(BuildContext context, String name) {
  Scaffold.of(context).removeCurrentSnackBar();
  if (ModalRoute.of(context).settings.name != name) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        name,
        (route) =>
            (route.isCurrent && route.settings.name == name) ? false : true);
    return;
  }
  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Already Opened.')));
}

void transitionNamed(BuildContext context, String name) {
  if (ModalRoute.of(context).settings.name != name)
    Navigator.of(context).pushNamedAndRemoveUntil(
        name,
        (route) =>
            (route.isCurrent && route.settings.name == name) ? false : true);
}

class ShowCaseDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Shindy.DrawerHeader(title: 'Menu'),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(0),
              children: [
                ListTile(
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                    _transitionNamed(context, '/');
                  },
                ),
                ExpansionTile(
                  title: Text('Widgets'),
                  children: <Widget>[
                    ListTile(
                      title: Text('Buttons'),
                      onTap: () {
                        Navigator.pop(context);
                        _transitionNamed(context, '/buttons');
                      },
                    ),
                    ListTile(
                      title: Text('Picture'),
                      onTap: () {
                        Navigator.pop(context);
                        _transitionNamed(context, '/picture');
                      },
                    ),
                    ListTile(
                      title: Text('SlideCards'),
                      onTap: () {
                        Navigator.pop(context);
                        _transitionNamed(context, '/slidecards');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(50),
                  child: IconButton(
                    tooltip: 'Settings',
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                      _transitionNamed(context, '/settings');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
