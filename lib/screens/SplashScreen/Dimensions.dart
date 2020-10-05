import 'package:flutter/material.dart';

import 'package:oraan/configs/App.dart';
import 'package:oraan/configs/AppDimensions.dart';

class Dimensions {
  static double logoWidth;

  static init(BuildContext context) {
    App.init(context);
    logoWidth = AppDimensions.ratio * 50 + 200;
  }
}
