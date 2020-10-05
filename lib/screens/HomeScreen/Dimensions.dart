import 'package:flutter/material.dart';

import 'package:oraan/configs/App.dart';
import 'package:oraan/configs/AppDimensions.dart';

class Dimensions {
  static double avatarSize;

  static init(BuildContext context) {
    App.init(context);

    avatarSize = AppDimensions.ratio * 15 + 60;
  }
}
