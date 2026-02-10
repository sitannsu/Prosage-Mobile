import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  final Widget? tv;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.tv,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
      
  static bool isTV(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1440;

  @override
  Widget build(BuildContext context) {
    if (tv != null && isTV(context)) {
      return tv!;
    }
    
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1440 && tv != null) {
          return tv!;
        } else if (constraints.maxWidth >= 1024) {
          return desktop;
        } else if (constraints.maxWidth >= 600) {
          return tablet ?? desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
