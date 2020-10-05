import 'package:flutter/material.dart';

import 'package:oraan/configs/AppDimensions.dart';
import 'package:oraan/configs/App.dart';

class Dimensions {
  static double iconTranslateX;
  static init(BuildContext context) {
    App.init(context);

    iconTranslateX = 80 + AppDimensions.ratio * 30;
  }
}
