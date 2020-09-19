import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/notifiers/booleannotifier.dart';
import 'package:showcase/notifiers/colornotifier.dart';
import 'package:showcase/pages/pages.dart';
import 'package:showcase/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(ProviderScope(child: ShowCaseApp()));

final isDarkProvider = StateNotifierProvider((ref) => BooleanNotifier());
final osDarkProvider = StateNotifierProvider((ref) => BooleanNotifier());
final primaryColorProvider =
    StateNotifierProvider((ref) => MaterialColorNotifier());

class ShowCaseApp extends StatefulWidget {
  ShowCaseApp({Key key, this.title}) : super(key: key);
  final title;
  @override
  _ShowCaseConfig createState() => _ShowCaseConfig(title: title);
}

class _ShowCaseConfig extends State<ShowCaseApp> {
  _ShowCaseConfig({title}) : this._title = title ?? "Flutter App";
  final String _title;

  Future<void> initConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool _osDark = prefs.getBool('osDark') ?? false;
    context
        .read(isDarkProvider)
        .setState(_osDark ? false : prefs.getBool('isDark') ?? false);
    context.read(osDarkProvider).setState(_osDark);

    Colors.primaries.forEach((element) {
      if (element.value == prefs.getInt('primaryColor'))
        context.read(primaryColorProvider).setState(element ?? Colors.blue);
    });
  }

  @override
  void initState() {
    super.initState();
    initConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, widget) => MaterialApp(
        title: _title,
        theme: (!watch(osDarkProvider.state) && watch(isDarkProvider.state))
            ? ShowCaseTheme.dark(watch(primaryColorProvider.state))
            : ShowCaseTheme.light(watch(primaryColorProvider.state)),
        darkTheme: watch(osDarkProvider.state)
            ? ShowCaseTheme.dark(watch(primaryColorProvider.state))
            : null,
        initialRoute: '/',
        routes: {
          '/': (context) => MainPage(title: _title),
          '/buttons': (context) => ButtonsPage(title: 'Bottuns'),
          '/settings': (context) => SettinsPage(title: 'Settings')
        },
      ),
    );
  }
}
