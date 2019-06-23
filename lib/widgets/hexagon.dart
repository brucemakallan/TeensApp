import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

import '../assets.dart';

Widget wrapInHexagon(Widget child) => ClipPolygon(
      sides: 6,
      borderRadius: 5.0,
      boxShadows: [
        PolygonBoxShadow(color: CustomTheme.logoBlue, elevation: 1.0),
        PolygonBoxShadow(color: CustomTheme.logoBlue, elevation: 5.0)
      ],
      child: child,
    );
