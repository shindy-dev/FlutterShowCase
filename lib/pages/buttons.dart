import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcase/drawer.dart';
import 'package:showcase/shindywidgets/material.dart' as Shindy;

class ButtonsPage extends StatelessWidget {
  ButtonsPage({Key key, this.title}) : super(key: key);
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
        builder: (context) => ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          children: [
            Shindy.TextDivider(title: typeName(MaterialButton)),
            MaterialButton(
              child: Text(typeName(MaterialButton)),
              onPressed: () => _showSnackBar(context, typeName(MaterialButton)),
            ),
            Shindy.TextDivider(title: typeName(FlatButton)),
            FlatButton(
              child: Text(typeName(FlatButton)),
              onPressed: () => _showSnackBar(context, typeName(FlatButton)),
            ),
            Shindy.TextDivider(title: typeName(OutlineButton)),
            OutlineButton(
              child: Text(typeName(OutlineButton)),
              onPressed: () => _showSnackBar(context, typeName(OutlineButton)),
            ),
            Shindy.TextDivider(title: typeName(RaisedButton)),
            RaisedButton(
              textColor: Colors.white,
              child: Text(typeName(RaisedButton)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () => _showSnackBar(context, typeName(RaisedButton)),
            ),
            Shindy.TextDivider(title: '${typeName(RaisedButton)} with Icon'),
            RaisedButton.icon(
              textColor: Colors.white,
              icon: Icon(Icons.alternate_email),
              label: Text(typeName(RaisedButton)),
              splashColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () => _showSnackBar(context, typeName(RaisedButton)),
            ),
            Shindy.TextDivider(title: '${typeName(ButtonBar)}'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                BackButton(
                  onPressed: () => _showSnackBar(context, typeName(BackButton)),
                ),
                CloseButton(
                  onPressed: () =>
                      _showSnackBar(context, typeName(CloseButton)),
                ),
                IconButton(
                  tooltip: typeName(IconButton),
                  icon: Icon(Icons.android),
                  onPressed: () => _showSnackBar(context, typeName(IconButton)),
                ),
                Shindy.PopupMenuButton(
                  ['A', 'B', 'C', 'D', 'E'],
                  onSelected: (v) => _showSnackBar(context, v),
                ),
              ],
            ),
            Shindy.TextDivider(title: typeName(DropdownButton)),
            Shindy.DropdownButton(
              ['A', 'B', 'C', 'D', 'E'],
              onChenged: (v) => _showSnackBar(context, v),
            ),
            Shindy.TextDivider(title: typeName(ToggleButtons)),
            Container(
              alignment: Alignment.center,
              child: Shindy.ToggleButtons(
                [
                  Icon(Icons.signal_wifi_4_bar),
                  Icon(Icons.bluetooth),
                  Icon(Icons.airplanemode_active),
                ],
                [true, false, true],
                onPressed: (index) =>
                    {_showSnackBar(context, index.toString())},
              ),
            ),
            Shindy.TextDivider(title: typeName(CupertinoButton)),
            CupertinoButton(
              child: Text(typeName(CupertinoButton)),
              onPressed: () =>
                  _showSnackBar(context, typeName(CupertinoButton)),
            ),
          ],
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
