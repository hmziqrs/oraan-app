import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

import 'theme.dart' as theme;

class AppTheme {
  static BuildContext ctx;

  static Color cardBg;
  static Color background;

  static Color shadow;
  static Color shadow2;
  static Color lightShadow;
  static Color lightShadow2;

  // Consts
  static final TinyColor dark = TinyColor.fromString('#333');
  static final TinyColor light = TinyColor.fromString('#fdfdfd');

  static final Color primary = theme.primary;
  static final Color accent = theme.accent;

  static final Color text = theme.accent;
  static final Color textSub = theme.accent.withOpacity(0.60);

  // Init
  static init(BuildContext context) {}

  static bool isDark([BuildContext ctx]) =>
      Theme.of(ctx ?? AppTheme.ctx).brightness == Brightness.dark;
}
