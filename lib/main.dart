import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:showcase/notifiers/primarycolornotifier.dart';
import 'package:showcase/pages/pages.dart';
import 'package:showcase/themes/themes.dart';
import 'package:showcase/notifiers/isdarknotifier.dart';

void main() {
  runApp(
    ProviderScope(
      child: ShowCaseApp(),
    ),
  );
}

final isDarkProvider = StateNotifierProvider((ref) => IsDarkNotifier());
final primaryColorProvider =
    StateNotifierProvider((ref) => PrimaryColorNotifier());

class ShowCaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, widget) => MaterialApp(
        title: 'Show Case',
        theme: watch(isDarkProvider.state)
            ? ShowCaseTheme.dark(watch(primaryColorProvider.state))
            : ShowCaseTheme.light(watch(primaryColorProvider.state)),
        initialRoute: '/',
        routes: {
          '/': (context) => MainPage(title: 'Show Case'),
          '/buttons': (context) => ButtonsPage(title: 'Bottuns'),
          '/settings': (context) => SettinsPage(title: 'Settings')
        },
      ),
    );
  }
}
