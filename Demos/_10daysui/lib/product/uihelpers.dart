// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProjectMediaQuery {
  late final BuildContext context;

  ProjectMediaQuery({required this.context});
  Size get size => MediaQuery.of(context).size;
  double get shortestSide => MediaQuery.of(context).size.shortestSide;
  double get longSide => MediaQuery.of(context).size.longestSide;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  bool get isLandscape => MediaQuery.of(context).orientation == Orientation.landscape;
  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;

  bool get isMobile => size.width < 600;
  bool get isTablet => size.width >= 600 && size.width < 1024;
  bool get isDesktop => size.width >= 1024;


  bool getDeviceType(Size size) {
    if (size.width < 600) {
      return isMobile;
    } else if (size.width > 600 && size.width <= 1024) {
      return isTablet;
    } else {
      return isDesktop;
    }
  }
}

enum DeviceType { mobile, tablet, desktop }

mixin Paddings {
  static const double zero = 0;

  static EdgeInsets paddingAll(double value) => EdgeInsets.all(value);
  static EdgeInsets paddingOnly({double top = zero, double right = zero, double bottom = zero, double left = zero}) =>
      EdgeInsets.only(top: top, bottom: bottom, right: right, left: left);
  static EdgeInsets paddingSymetric({double vertical = zero, double horizontal = zero}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}

class Colorsui {
  static Color primary = Colors.deepPurple;
  static Color colors_493e8a = Color(0xFF493E8A);
  static Color colors_4a4d53 = Color(0xFF4A4D53);
  static Color colorsTransparent = Colors.transparent;
  static Color colorsWhite = Colors.white;
  static Color colors_ff5678 = Color(0xFFFF5678);
  static Color colors_grey200 = Colors.grey.shade200;
}
