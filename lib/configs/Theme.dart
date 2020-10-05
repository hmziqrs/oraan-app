import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

final primary = Pigment.fromString("#50C4CC");
final accent = Pigment.fromString("#2B4655");

final darkBackground = Pigment.fromString('#1c1c1e');

final subText = Pigment.fromString('#1c1d24').withOpacity(0.6);
final indicator = Pigment.fromString('#1c1d24').withOpacity(0.4);

final base = ThemeData(
  fontFamily: 'Muli',
  accentColor: primary,
  primaryColor: primary,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
);

final baseDark = ThemeData(
  fontFamily: 'Muli',
  accentColor: primary,
  primaryColor: primary,
  brightness: Brightness.dark,
  backgroundColor: darkBackground,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: darkBackground,
);
