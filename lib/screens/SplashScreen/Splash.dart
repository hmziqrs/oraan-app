import 'package:flutter/material.dart';
import 'package:oraan/configs/AppDimensions.dart';

import 'package:oraan/configs/TextStyles.dart';
import 'package:oraan/configs/AppTheme.dart';

import 'package:oraan/widgets/Screen/Screen.dart';

import 'Dimensions.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      scaffoldBackgroundColor: AppTheme.primary.color,
      child: Container(
        transform: Matrix4.identity()
          ..translate(0.0, -Dimensions.logoWidth * 0.35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/logo-white.png",
              width: Dimensions.logoWidth,
              height: Dimensions.logoWidth,
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.white.withOpacity(0.4),
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ),
            SizedBox(height: AppDimensions.padding * 2),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 6,
              ),
              child: Text(
                "Save money and money will save you",
                style: TextStyles.heading46.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
