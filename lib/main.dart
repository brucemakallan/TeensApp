import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/splash_screen.dart';
import './utils/assets.dart';
import './state.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalState>.value(
          value: GlobalState(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: CustomTheme.primary500,
          primaryColorLight: CustomTheme.primary300,
          primaryColorDark: CustomTheme.primary900,
          accentColor: CustomTheme.accent500,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
