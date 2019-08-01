import 'package:flutter/material.dart';
import 'dart:async';

import '../utils/assets.dart';
import '../widgets/hexagon.dart';
import '../widgets/logo_blink.dart';
import '../screens/login.dart';
import '../widgets/scale_animation.dart';
import '../utils/shared_pref.dart';
import '../screens/homepage/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _gotoHomePage();
  }

  Future<void> _gotoHomePage() async {
    SharedPref('email')
        .getValue()
        .then((email) => Timer(Duration(seconds: 4), () {
              Navigator.pushReplacement(
                context,
                ScaleRoute(page: HomePage()),
              );
            }))
        .catchError((e) => Timer(Duration(seconds: 4), () {
              Navigator.pushReplacement(
                context,
                ScaleRoute(page: Login()),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(LocalImages.splashBackground),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 260.0,
              height: 260.0,
              child: wrapInHexagon(AnimatedLogo()),
            )));
  }
}
