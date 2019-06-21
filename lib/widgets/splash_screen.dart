import 'package:flutter/material.dart';

import '../assets.dart';
import './hexagon.dart';

class SplashScreen extends StatelessWidget {
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
                child: wrapInHexagon(
                  Image.asset(
                    LocalImages.logoWithBackground,
                    fit: BoxFit.fill,
                  ),
                ))));
  }
}
