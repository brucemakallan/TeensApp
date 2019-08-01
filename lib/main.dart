import 'package:flutter/material.dart';

import './screens/splash_screen.dart';
import './assets.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: CustomTheme.primary500,
        primaryColorLight: CustomTheme.primary300,
        primaryColorDark: CustomTheme.primary900,
        accentColor: CustomTheme.accent500,
      ),
      home: SplashScreen(),
    );
  }
}
