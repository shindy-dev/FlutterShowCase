import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:showcase/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/main.dart'
    show isDarkProvider, osDarkProvider, primaryColorProvider;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcase/shindywidgets/material.dart';

class SettinsPage extends StatelessWidget {
  SettinsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title),
      ),
      drawer: ShowCaseDrawer(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        children: [
          TextDivider(title: 'Theme'),
          ListItem(
            title: 'Match The OS Theme',
            child: Switch(
              value: context.read(osDarkProvider.state),
              onChanged: (v) async {
                context.read(osDarkProvider).toggle(v);
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('osDark', v);
                if (v) {
                  context.read(isDarkProvider).toggle(!v);
                  prefs.setBool('isDark', !v);
                }
              },
            ),
          ),
          ListItem(
            title: 'Dark Mode',
            child: Switch(
              value: context.read(isDarkProvider.state),
              onChanged: !context.read(osDarkProvider.state)
                  ? ((v) async {
                      context.read(isDarkProvider).toggle(v);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('isDark', v);
                    })
                  : null,
            ),
          ),
          ListItem(
            title: 'Primary Color',
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Color Picker',
              ),
              onPressed: () => showDialog(
                context: context,
                child: AlertDialog(
                  title: const Text('Pick a PrimaryColor'),
                  content: SingleChildScrollView(
                    child: BlockPicker(
                        pickerColor: Theme.of(context).primaryColor,
                        onColorChanged: (c) async {
                          context.read(primaryColorProvider).changeColor(c);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setInt('primaryColor', c.value);
                        },
                        availableColors: Colors.primaries),
                  ),
                  actions: [
                    FlatButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
