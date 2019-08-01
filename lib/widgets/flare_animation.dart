import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareAnimation extends StatelessWidget {
  final String animationAsset;
  final String animationCommand;

  FlareAnimation(this.animationAsset, this.animationCommand);

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      this.animationAsset,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      animation: this.animationCommand,
    );
  }
}
