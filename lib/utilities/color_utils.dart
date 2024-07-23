
import 'package:flutter/material.dart';

Color shiftHsl(Color c, [double amt = 0]) {
  var hslc = HSLColor.fromColor(c);
  return hslc.withLightness((hslc.lightness + amt).clamp(0.0, 1.0)).toColor();
}
