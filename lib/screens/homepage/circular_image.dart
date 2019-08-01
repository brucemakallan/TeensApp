import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final ImageProvider image;
  final double width, height;

  CircularImage(this.image, {this.width = 50, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: image),
      ),
    );
  }
}
