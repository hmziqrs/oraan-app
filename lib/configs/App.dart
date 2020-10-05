import 'package:flutter/material.dart';

import 'AppDimensions.dart';
import 'AppTheme.dart';
import 'TextStyles.dart';

class App {
  static BuildContext ctx;
  static bool isLtr;
  static bool showAds = false;

  static init(BuildContext context) {
    AppDimensions.init(context);
    TextStyles.init();
    AppTheme.init(context);
    App.ctx = context;

    isLtr = Directionality.of(context) == TextDirection.ltr;
  }
}
