import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import '../assets.dart';

class AnimatedLogo extends StatefulWidget {
  @override
  LogoState createState() => LogoState();
}

class LogoState extends State<AnimatedLogo> {
  bool active;

  @override
  void initState() {
    active = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _flare(CustomAnimations.logoBlink);
  }

  Widget _flare(String animationAsset) {
    return GestureDetector(
      onTap: () {
        setState(() {
          active = true;
        });
      },
      child: FlareActor(
        animationAsset,
        fit: BoxFit.fill,
        animation: active ? 'blinkLeft' : 'idle',
      ),
    );
  }
}
