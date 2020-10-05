import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oraan/UI.dart';
import 'package:oraan/configs/AppDimensions.dart';

import 'package:oraan/configs/TextStyles.dart';
import 'package:oraan/configs/AppTheme.dart';
import 'package:oraan/providers/auth/provider.dart';

import 'package:oraan/widgets/Screen/Screen.dart';
import 'package:provider/provider.dart';

import 'Dimensions.dart';
import 'data.dart' as data;

class HomeScreen extends StatelessWidget {
  AuthProvider getState(BuildContext context, [bool listen = false]) =>
      Provider.of<AuthProvider>(
        context,
        listen: listen,
      );

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final state = this.getState(context, true);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!state.initLifeSavings) {
        state.getLifeSavings();
      }
    });

    return Screen(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: AppDimensions.padding * 4 +
                    UI.mediaQuery(context).padding.top,
                bottom: AppDimensions.padding * 2,
              ),
              color: AppTheme.accent,
              // color: Colors.red,
              child: Column(
                children: [
                  Container(
                    width: Dimensions.avatarSize,
                    height: Dimensions.avatarSize,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Transform.scale(
                      scale: 1.2,
                      child: Image.asset(
                        "assets/icons/avatar.png",
                        width: Dimensions.avatarSize,
                        height: Dimensions.avatarSize,
                      ),
                    ),
                  ),
                  SizedBox(height: AppDimensions.padding * 2),
                  Text(
                    "NAME",
                    style: TextStyles.body1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Content
            SizedBox(height: AppDimensions.padding * 2),
            SvgPicture.asset(
              "assets/icons/savings-gold.svg",
              width: Dimensions.avatarSize,
              height: Dimensions.avatarSize,
            ),
            Text(
              "Your patience and discipline is paying off!!",
            ),
            Text(
              "Lifetime savings",
              style: TextStyles.heading46,
            ),
            state.loading
                ? Padding(
                    padding: EdgeInsets.only(
                      top: AppDimensions.padding,
                    ),
                    child: LinearProgressIndicator(
                      backgroundColor: AppTheme.accent.withOpacity(0.1),
                    ),
                  )
                : Text(
                    "PKR ${state.user.lifeSavings}",
                    style: TextStyles.heading26,
                  ),
            state.error && !state.loading
                ? FlatButton(
                    color: AppTheme.primary,
                    onPressed: () => state.getLifeSavings(),
                    child: Text("FetchAgain"),
                  )
                : SizedBox(),
            Flexible(
              child: SizedBox(
                height: double.infinity,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),
              child: Row(
                children: data.tabs
                    .map(
                      (tab) => Flexible(
                        child: Material(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: AppDimensions.padding * 2,
                              ),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  tab.icon != null
                                      ? Icon(
                                          tab.icon,
                                          color: AppTheme.text,
                                        )
                                      : SizedBox(),
                                  tab.svgAsset != null
                                      ? SvgPicture.asset(
                                          tab.svgAsset,
                                        )
                                      : SizedBox(),
                                  SizedBox(height: AppDimensions.padding / 2),
                                  Text(
                                    tab.label,
                                    style: TextStyles.body36.copyWith(
                                      color: AppTheme.text,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
