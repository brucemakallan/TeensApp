import 'package:flutter/material.dart';
import 'dart:async';

import '../assets.dart';
import './hexagon.dart';
import './logo_blink.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen(PageController pageController, {int pageIndex = 1}) {
    Timer(Duration(seconds: 4), () {
      pageController.animateToPage(pageIndex,
          duration: Duration(seconds: 2), curve: Curves.easeOutExpo);
    });
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
              width: 200.0,
              height: 200.0,
              child: wrapInHexagon(AnimatedLogo()),
            )));
  }
}
