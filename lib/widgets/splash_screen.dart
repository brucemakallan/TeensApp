import 'package:flutter/material.dart';
import 'dart:async';

import '../assets.dart';
import './hexagon.dart';
import './logo_blink.dart';
import './home.dart';
import './scale_animation.dart';

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

  Future<Timer> _gotoHomePage() async {
    return new Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        ScaleRoute(page: Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
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
                ))),
      ),
    );
  }
}
