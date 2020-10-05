import 'package:flutter/material.dart';

class AppTab {
  AppTab({
    @required this.label,
    this.icon,
    this.svgAsset,
  });

  final String label;
  IconData icon;
  String svgAsset;
}

final tabs = [
  AppTab(
    label: "Home",
    icon: Icons.home,
  ),
  AppTab(
    label: "Committes",
    svgAsset: "assets/icons/committees.svg",
  ),
  AppTab(
    label: "Pay Now",
    icon: Icons.add_circle_outline,
  ),
  AppTab(
    label: "Transactions",
    icon: Icons.notifications_sharp,
  ),
  AppTab(
    label: "Settings",
    icon: Icons.settings,
  ),
];
