import 'package:flutter/material.dart';

import 'package:oraan/configs/TextStyles.dart';
import 'package:oraan/configs/AppTheme.dart';

class Screen extends StatelessWidget {
  Screen({
    this.init,
    this.child,
    this.drawer,
    this.builder,
    this.debugLabel,
    this.belowBuilder,
    this.bottomNavigationBar,
    this.scaffoldBackgroundColor,
  });

  final Widget child;
  final Widget drawer;
  final String debugLabel;
  final Widget bottomNavigationBar;
  final Color scaffoldBackgroundColor;
  final void Function(BuildContext) init;
  final Widget Function(BuildContext) builder;
  final Widget Function(BuildContext context) belowBuilder;

  @override
  Widget build(BuildContext context) {
    if (this.init != null) {
      this.init(context);
    }
    return Scaffold(
      drawer: this.drawer,
      bottomNavigationBar: this.bottomNavigationBar,
      backgroundColor: this.scaffoldBackgroundColor ??
          Theme.of(context).scaffoldBackgroundColor,
      body: DefaultTextStyle(
        style: TextStyle(
          fontFamily: "Muli",
          color: AppTheme.text,
          fontSize: TextStyles.body16.fontSize,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            this.belowBuilder != null
                ? this.belowBuilder(context)
                : Container(),
            Positioned.fill(
              child: child ?? builder(context),
            ),
          ],
        ),
      ),
    );
  }
}
