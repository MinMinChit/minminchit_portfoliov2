import 'package:flutter/material.dart';
import 'package:mmc_portfoliov2/constants/color_style.dart';

class Utility {
  static Color colorCodeToColor(String colorCode) {
    try {
      return Color(int.parse(colorCode));
    } catch (e) {
      return KTextStyle.cBlack;
    }
  }
}
