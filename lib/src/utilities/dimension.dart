import 'package:flutter/material.dart';

class MyDimensions {
  /// Returns the width of the screen.
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Returns the height of the screen.
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
